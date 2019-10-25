# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Chris Werner Rau < aur [ at ] cwrau [ dot ] io >
# contributer: Alif Rachmawadi <arch@subosito.com>
pkgname=dep-bin
pkgver=0.5.4
pkgrel=2
pkgdesc="Go dependency management tool"
pkgoption1="dep-linux-amd64"
pkgoption2="dep-linux-arm64"
arch=('any')
url="https://github.com/golang/dep"
license=('BSD')
conflicts=('dep')
provides=('dep')
#detect architecture & adjust source & checksums accordingly
sha256sums=('69c47f09a7aec01c59ff1bdc346406d36e84df11461fb2bed92b0d185a7a2ccb')
case "$CARCH" in
	arm*) _pkgarch="$pkgoption2"
		sha256sums+=('9dbf1612044598cbb195933213eb3c4bab5d4ada0ce5b90a91241c4431b1783a')
		;;
  aarch64*) _pkgarch="$pkgoption2"
    sha256sums+=('9dbf1612044598cbb195933213eb3c4bab5d4ada0ce5b90a91241c4431b1783a')
    ;;
	x86_64) _pkgarch="$pkgoption1"
		sha256sums+=('40a78c13753f482208d3f4bea51244ca60a914341050c588dad1f00b1acc116c')
		;;
esac
source=("LICENSE" "${url}/releases/download/v${pkgver}/$_pkgarch")

package() {
	install -Dm755 dep-linux-a* ${pkgdir}/usr/bin/dep
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
