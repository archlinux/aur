# Maintainer: calamity <calamity dot aur at mailban dot de>
pkgname=doasedit-alternative
pkgver=1.0.9
pkgrel=1
pkgdesc="Edit files as root using an unprivileged editor"
arch=('any')
url="https://codeberg.org/TotallyLeGIT/doasedit"
license=('MIT')
depends=('doas')
provides=('doasedit')
conflicts=('doasedit')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('39f26d3ef0bace99676c99264c6c0c64a4863200b16f1684d07a49c4f8a56e38')

package() {
	cd doasedit
	make prefix="/usr" DESTDIR="${pkgdir}" install
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
