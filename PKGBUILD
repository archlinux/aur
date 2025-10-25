# Maintainer: Julio González <juliolokooo@gmail.com>
# Contributor: Erik Dubois <erik.dubois@gmail.com>
pkgname=sardi-icons
pkgver=25.10
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
sha256sums=('3d28c31a94d7248e40b536c8cef19a812b4fc1d90353294bf962410e1b4730a6')

package() {
	find ${srcdir} -type f -name "*.sh" -exec chmod 644 '{}' \;
	install -dm 755 ${pkgdir}${_destname}
	rm ${srcdir}/${pkgname}
  	cp -r ${srcdir}/* ${pkgdir}${_destname}
}
