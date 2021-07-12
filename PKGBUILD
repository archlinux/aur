# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.38.0
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('x86_64' 'aarch64' 'armv6h')
url="https://wtfutil.com"
license=('MPL2')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_x86_64=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_armv6.tar.gz")
sha256sums_x86_64=('f63f6dbd7a965066b1616e298ac4d33298ad4de445b42097856d317b3f61f0fe')
sha256sums_aarch64=('b5fca29d3cd0e3e3b20c2cf841fd4a585f5dbac2f22e053aa22061cc6faff5f5')
sha256sums_armv6h=('b81596a08fcefc6a5f5788e66a157524a5fce8858573accc89d30fd882808983')

package() {
	cd $(find . -name "wtf_$pkgver_*" -type d | sed 1q)
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
	install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
