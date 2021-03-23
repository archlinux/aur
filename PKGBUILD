# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.36.0
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
sha256sums_x86_64=('fc3d8a885b85c505d1182000c119896ccfc18d1f8380cd107375a155d7d4cde3')
sha256sums_aarch64=('7bd66abdfc9a13272e7868b86e12974c621065b95d441a16ddae25bbe41ec526')
sha256sums_armv6h=('f9aa66ff146277cc85682ba59d1d4db31d0795fefaf67d7f57d8bef95e1e5b87')

package() {
	cd $(find . -name "wtf_$pkgver_*" -type d | sed 1q)
	install -Dm755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
	install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
