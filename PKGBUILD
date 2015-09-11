# Maintainer: Lockheed <qwrules@gmail.com>

pkgname=rainlendar-pro
pkgver=2.12.2
pkgrel=1
pkgdesc="A desktop Calendar, ToDo list and Event list"
arch=('i686' 'x86_64')
url="http://www.rainlendar.net/"
license=('custom')
depends=('cairo' 'libsm' 'expat>=1.95.8' 'libstdc++5' 'libpng12' 'openssl098')
provides=('rainlendar2')
conflicts=('rainlendar-beta' 'rainlendar-beta-unstable' 'rainlendar-lite')

if [ "${CARCH}" = 'x86_64' ]; then
    source=(http://www.rainlendar.net/download/Rainlendar-Pro-$pkgver-amd64.tar.bz2)
    md5sums=('f990558f0e2543f6536bb90a85d44542')
  else
    source=(http://www.rainlendar.net/download/Rainlendar-Pro-$pkgver-i386.tar.bz2)
    md5sums=('dfc0d813b97015c4fb188e6c73aedbf9')
fi

package() {
  cd ${srcdir}

  install -d ${pkgdir}/opt ${pkgdir}/usr/bin \
    ${pkgdir}/usr/share/licenses/$pkgname ${pkgdir}/usr/lib

  cp -R ${srcdir}/rainlendar2 ${pkgdir}/opt
  ln -s /opt/rainlendar2/rainlendar2 ${pkgdir}/usr/bin/rainlendar
  ln -s /opt/rainlendar2/License.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

