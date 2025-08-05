# Maintainer: calamity <calamity dot aur at mailban dot de>
pkgname=doasedit-alternative
pkgver=1.0.8
pkgrel=1
pkgdesc="Edit files as root using an unprivileged editor"
arch=('any')
url="https://codeberg.org/TotallyLeGIT/doasedit"
license=('MIT')
depends=('doas')
provides=('doasedit')
conflicts=('doasedit')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('39c86886dd166bc373f1b81cb549b46bd54d9b52cdd2bcf0696cd08ddbd50a4e')

package() {
	cd doasedit
	make prefix="/usr" DESTDIR="${pkgdir}" install
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
