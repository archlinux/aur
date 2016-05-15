# Maintainer: Nitin Mathew <nitn_mathew2000@hotmail.com>                                                                                             
pkgname=settimezone                                                                                                                                 
pkgver=0.2.3
pkgrel=2
pkgdesc="To change the timezone in Arch Linux."

arch=('i686' 'x86_64')
url="https://github.com/nsmathew/settimezone"
license=('GPL3')
depends=('python' 'tk')
makedepends=()
install=$pkgname.install
source=(https://github.com/nsmathew/SetTimeZone/archive/v${pkgver}.tar.gz)
sha256sums=('0ccd152d709c2567324623554acc4d20a05103fee8063529b7e4914f31e4a19e')

package() {
        cd ${srcdir}/${pkgname}-${pkgver}
        install -D -m755 sources/settimezone.py ${pkgdir}/usr/bin/settimezone
        install -D -m644 COPYING ${pkgdir}/usr/share/licenses/settimezone/COPYING
        
        install -D -m644 resources/settimezone16x16.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/settimezone.png
        install -D -m644 resources/settimezone22x22.png ${pkgdir}/usr/share/icons/hicolor/22x22/apps/settimezone.png
        install -D -m644 resources/settimezone32x32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/settimezone.png
        install -D -m644 resources/settimezone48x48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/settimezone.png
        install -D -m644 resources/settimezone128x128.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/settimezone.png
        install -D -m644 resources/settimezone256x256.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/settimezone.png
        install -D -m644 resources/settimezone.desktop ${pkgdir}/usr/share/applications/settimezone.desktop

	#Remove the downloaded source
	cd ../.. && rm -fr v${pkgver}.tar.gz
}
