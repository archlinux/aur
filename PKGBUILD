# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.22.0
pkgrel=2
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
sha256sums_i686=('fa48d85db54ee8005de6a25109e09138374cb90e8d0814f2d42ebd65322bd0fd')
sha256sums_x86_64=('73d9761f34d6b5c157bf16a11442176f03d9e1fd7595923042d87a47a2fcd53f')
sha256sums_aarch64=('310a8203c9fce0202b1132cafdee593909ce3a58b13c13995ca9e61e6eaffb4d')
sha256sums_armv6h=('4520e8182b3e8b58173e395615e1c91ef9765d5e8457720c95731a7aa2aca47f')

package() {
	cd $(find . -name "wtf_$pkgver_*" -type d | sed 1q)
	install -Dm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE.md"
	install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/${pkgname%-bin}/CHANGELOG.md"
}
