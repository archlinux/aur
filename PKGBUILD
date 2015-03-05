# Contributors: Mladen Pejaković <pejakm@gmail.com>

pkgname=slimrat
_realver=1.1-beta2
pkgver=1.1_beta2
pkgrel=1
pkgdesc="Command-line application for automated downloading from file hosters like Rapidshare, Megaupload, Depositfiles and many more"
url="http://code.google.com/p/slimrat"
license=('MIT')
arch=('any' )
depends=('perl' 'perl-www-mechanize' 'perl-http-response-encoding' 'perl-json')
optdepends=('slimrat-gui:	for GUI'
            'aview:		for CAPTCHA support in command line')

backup=('etc/slimrat.conf')
install=${pkgname}.install
source=(http://slimrat.googlecode.com/files/${pkgname}-${_realver}.tar.bz2)

md5sums=('ed244022741611f7d587016280e94263')

build() {
  cd ${srcdir}/${pkgname}-${_realver}
  install -m 755 -d ${pkgdir}/usr/lib/${pkgname}/plugins ${pkgdir}/usr/bin
  install -m 644 -D src/plugins/* ${pkgdir}/usr/lib/${pkgname}/plugins
  install -m 644 -D src/Common.pm ${pkgdir}/usr/lib/${pkgname}/
  install -m 644 -D src/Configuration.pm ${pkgdir}/usr/lib/${pkgname}/
  install -m 644 -D src/Log.pm ${pkgdir}/usr/lib/${pkgname}/
  install -m 644 -D src/Plugin.pm ${pkgdir}/usr/lib/${pkgname}/
  install -m 644 -D src/Proxy.pm ${pkgdir}/usr/lib/${pkgname}/
  install -m 644 -D src/Queue.pm ${pkgdir}/usr/lib/${pkgname}/
  install -m 644 -D src/Toolbox.pm ${pkgdir}/usr/lib/${pkgname}/
  install -m 755 -D src/${pkgname} ${pkgdir}/usr/lib/${pkgname}/
  install -m 644 -D ${pkgname}.conf ${pkgdir}/etc/${pkgname}.conf
  install -m 644 -D COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
  ln -s /usr/lib/slimrat/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
