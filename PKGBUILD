# Maintainer: Julio González <juliolokooo@gmail.com>
# Contributor: Erik Dubois <erik.dubois@gmail.com>
pkgname=sardi-icons
pkgver=22.10
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
sha256sums=('2f189aa2adbbb6170384f7e5ad16012b94617dd6e0b7482f88e284c4c8932f0a')

package() {
	find ${srcdir} -type f -name "*.sh" -exec chmod 644 '{}' \;
	install -dm 755 ${pkgdir}${_destname}
	rm ${srcdir}/${pkgname}
  	cp -r ${srcdir}/* ${pkgdir}${_destname}
}
