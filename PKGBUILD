# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=privatebin-cli-bin
_binname=privatebin
pkgver=2.1.0
pkgrel=1
pkgdesc='A powerful CLI for creating and managing PrivateBin pastes with ease - binary package'
arch=(x86_64 aarch64 armv7h)
url='https://github.com/gearnode/privatebin'
license=('ISC')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="$pkgname.install"
source_x86_64=("$pkgname-$pkgver-amd64.tar.gz::$url/releases/download/v${pkgver}/${_binname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-arm64.tar.gz::$url/releases/download/v${pkgver}/${_binname}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("$pkgname-$pkgver-arm.tar.gz::$url/releases/download/v${pkgver}/${_binname}_${pkgver}_linux_armv6.tar.gz")

sha256sums_x86_64=('0f719a072c851bce9b4bdf2225d97519380de70d92e0f11438ba4519e18e458f')
sha256sums_aarch64=('d8ecb4c1994a037bc6e2a501531eae5680ed86822661d9d10354c5a6a1cb0a02')
sha256sums_armv7h=('087561f5d293de5ab4aa30a39e759132ee0a5037ce0624f44bbc98a79c75bf68')

package() {
  install -Dm755 $_binname "$pkgdir"/usr/bin/$_binname
  install -Dm644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
