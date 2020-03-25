# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=sardi-icons
pkgver=20.3
pkgrel=6
_destname="/usr/share/icons/"
pkgdesc="Sardi is an icon collection for any linux distro with 6 different circular icons and 10 different kind of folders. "
arch=('any')
url="http://sourceforge.net/projects/sardi"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip !emptydirs)
source=(sardi-icons::"http://downloads.sourceforge.net/project/sardi/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
sha256sums=('SKIP')
package() {
	find ${srcdir} -type f -name "*.sh" -exec chmod 644 '{}' \;
	install -dm 755 ${pkgdir}${_destname}
	rm ${srcdir}/${pkgname}
  	cp -r ${srcdir}/* ${pkgdir}${_destname}
}