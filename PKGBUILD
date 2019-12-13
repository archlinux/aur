# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.25.0
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('i686' 'x86_64' 'aarch64' 'armv6h')
url="https://wtfutil.com"
license=('MPL2')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source_i686=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("https://github.com/wtfutil/wtf/releases/download/v$pkgver/wtf_${pkgver}_linux_armv6.tar.gz")
sha256sums_i686=('0e4bdb5cd00bea7d03406c6d0c947b9bbc9e21ec9acb8b93084bd2cb2aca88d2')
sha256sums_x86_64=('04fb7b147cef5f4ab18f6f6c340a565d8aa5b6623fd316a3d576f227128221af')
sha256sums_aarch64=('b18e86bdc27b122227461faf595136ede9cca771aadce94aa63c3b536746886b')
sha256sums_armv6h=('7a24820c36f5c59c37b6309656e5e3873d16884540f0ee8c1d8e4928badaea29')

package() {
	cd $(find . -name "wtf_$pkgver_*" -type d | sed 1q)
	install -Dm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE.md"
	install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/${pkgname%-bin}/CHANGELOG.md"
}
