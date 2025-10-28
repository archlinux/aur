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
sha256sums=('bb02ab7a86b44f9128f6216946c8d21b41a1a4cc9acc06055d4774105a2239ee')

package() {
	cd doasedit
	make prefix="/usr" DESTDIR="${pkgdir}" install
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
