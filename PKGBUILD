# Maintainer: kaptoxic
# Contributor: Lockheed <qwrules@gmail.com>

pkgname=rainlendar-pro
pkgver=2.14.2
pkgrel=2
pkgdesc="A desktop Calendar, ToDo list and Event list"
arch=('i686' 'x86_64')
url="http://www.rainlendar.net/"
license=('custom')
depends=('cairo' 'libsm' 'expat>=1.95.8' 'libstdc++5' 'libpng12' 'openssl' 'librtmp0'
	# requirements on the old enchant library
	'enchant1.6'
	'webkitgtk2'
	# libidn won't cut it
	'libidn11'
)
provides=('rainlendar2')
conflicts=('rainlendar-beta' 'rainlendar-beta-unstable' 'rainlendar-lite')

if [ "${CARCH}" == 'x86_64' ]; then
    source=(http://www.rainlendar.net/download/Rainlendar-Pro-$pkgver-amd64.tar.bz2)
md5sums=('25b6b12d87eace8f33a48acc265e879c')
  else
    source=(http://www.rainlendar.net/download/Rainlendar-Pro-$pkgver-i386.tar.bz2)
fi

package() {
  cd ${srcdir}

  install -d ${pkgdir}/opt ${pkgdir}/usr/bin \
    ${pkgdir}/usr/share/licenses/$pkgname ${pkgdir}/usr/lib

  cp -R ${srcdir}/rainlendar2 ${pkgdir}/opt
  ln -s /opt/rainlendar2/rainlendar2 ${pkgdir}/usr/bin/rainlendar
  ln -s /opt/rainlendar2/License.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

