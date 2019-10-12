# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.23.0
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
sha256sums_i686=('71436fb36649c22b23ac79883c84baacee65f44cdc1b2b61cabba902c1263de6')
sha256sums_x86_64=('121fb0f11018ebb80f6efed04089453f6ddaac419686f9905ab03f04a4da382f')
sha256sums_aarch64=('a7e1eb135ad880ad9aea49a4dcbf47974de7b74819328e69b40a614de3e1a322')
sha256sums_armv6h=('bd3969335eccce03f548bb163f47ba32c4bfe15df0adedda7dd21399e803e4cd')

package() {
	cd $(find . -name "wtf_$pkgver_*" -type d | sed 1q)
	install -Dm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE.md"
	install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/${pkgname%-bin}/CHANGELOG.md"
}
