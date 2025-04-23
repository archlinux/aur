# Maintainer: Julio González <juliolokooo@gmail.com>
# Contributor: Erik Dubois <erik.dubois@gmail.com>
pkgname=sardi-icons
pkgver=25.04
pkgrel=1
_destname="/usr/share/icons/"
pkgdesc="Sardi is an icon collection for any linux distro with 6 different circular icons and 10 different kind of folders. "
arch=('any')
url="http://sourceforge.net/projects/sardi"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip !emptydirs)
source=(sardi-icons::"http://downloads.sourceforge.net/project/sardi/${pkgname}-${pkgver}-0${pkgrel}.tar.gz")
sha256sums=('936e4612b825c53fa02498c70b2d6146513bb74a245a6d82da27925e2305e742')

package() {
	find ${srcdir} -type f -name "*.sh" -exec chmod 644 '{}' \;
	install -dm 755 ${pkgdir}${_destname}
	rm ${srcdir}/${pkgname}
  	cp -r ${srcdir}/* ${pkgdir}${_destname}
}
