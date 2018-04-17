# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Kochetkov Andrey <gornet@gmail.com>
# Contributor: Fabian Schoelzel <myfirstname.mylastname@googlemail.com>

pkgname=pyfa
pkgver=1.36.0
pkgrel=2
_everelname="yc120.3"
_everelver=1.8
pkgdesc="EVE Online Fitting Assistant"
arch=('any')
url="https://github.com/pyfa-org/Pyfa"
license=('GPL3')
makedepends=('unzip')
depends=('python2' 'wxpython' 'python2-sqlalchemy' 'python2-dateutil' 'python2-requests' 'python2-urllib3' 'python2-logbook')
optdepends=('python2-matplotlib: for graph plotting'
        'python2-numpy: for graph plotting')
source=(https://github.com/pyfa-org/Pyfa/releases/download/v$pkgver/pyfa-$pkgver-$_everelname-$_everelver-linux.zip pyfa.desktop pyfa-start.sh)

package() {
  install -dm755 "${pkgdir}"/usr/share/pyfa
  cp -R "${srcdir}"/pyfa/* "${pkgdir}"/usr/share/pyfa
  
  install -dm755 "${pkgdir}"/usr/share/pixmaps
  unzip -p "${srcdir}"/pyfa/imgs.zip gui/pyfa64.png > "${pkgdir}"/usr/share/pixmaps/pyfa.png

  install -Dm644 "${srcdir}"/pyfa.desktop "${pkgdir}"/usr/share/applications/pyfa.desktop
  install -Dm755 "${srcdir}"/pyfa-start.sh "${pkgdir}"/usr/bin/pyfa
}

sha256sums=('d44b2c2e9224c809894f173a207bf05f30bfa9f537dd4ea74a4c4c559077b5dc'
            '1379bd28eff6d1b658896491de580f83bf2e3921be385bdb36be88ac4b65a394'
            '4d6609b76edab07f08e57b1b343d4c6b5f2e836ddcad28643ba0a6cedab9dd5c')

