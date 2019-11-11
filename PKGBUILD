# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.24.0
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
sha256sums_i686=('6beb79b0993b3722dbbde60bb96cb5594e5e3c7704599515396eb10ca4c4a2ef')
sha256sums_x86_64=('78392b40a3e46f2212ca0cb89e5782096ed5ceea2f8c1243eddd7e59190f33b6')
sha256sums_aarch64=('891ab947dc2bc81bac4f7360b79efa700c05a5511a6924d3321b57c25f4f7636')
sha256sums_armv6h=('1aacb7ec0a19f0f349e9b4a0d9f234e3866b4dee171a626c7fd9b066c70cdbc4')

package() {
	cd $(find . -name "wtf_$pkgver_*" -type d | sed 1q)
	install -Dm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE.md"
	install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-bin}/README.md"
	install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/${pkgname%-bin}/CHANGELOG.md"
}
