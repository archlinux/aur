# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Juan Tascon <juan at horlux dot org>
pkgname=wtfutil-bin
pkgver=0.28.0
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
sha256sums_i686=('3f3816812e05f9e4bc2f00b9d206f313f4fc25d44e5ff5ddf75c7d822e86a4d2')
sha256sums_x86_64=('f89d7f38f9c3a728402161b249748c18834e631127a9bdf0318601f7507e6b9f')
sha256sums_aarch64=('89b641b4f84916d391b1e87163ca2a3d5fb13707b7f6f76c31fa745aa12902a0')
sha256sums_armv6h=('279a353543591c0cafef66a320bf483a0bba85fe2bca7d6cb7f927620865a866')

package() {
	cd $(find . -name "wtf_$pkgver_*" -type d | sed 1q)
	install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
	install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
}
