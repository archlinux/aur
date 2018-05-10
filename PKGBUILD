# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Kochetkov Andrey <gornet@gmail.com>
# Contributor: Fabian Schoelzel <myfirstname.mylastname@googlemail.com>

pkgname=pyfa
pkgver=2.0.0
pkgrel=2
_distname="Pyfa-${pkgver}"
pkgdesc="EVE Online Fitting Assistant"
arch=('any')
url="https://github.com/pyfa-org/Pyfa"
license=('GPL3')
makedepends=('unzip')
depends=('python' 'python-wxpython' 'python-logbook' 'python-matplotlib' 'python-dateutil' 'python-requests' 'python-sqlalchemy' 'python-cryptography' 'python-markdown2' 'python-packaging' 'python-beautifulsoup4' 'python-pyaml' 'python-diskcache' 'python-esipy' 'python-roman')
optdepends=()
source=(https://github.com/pyfa-org/Pyfa/archive/v$pkgver.tar.gz pyfa.desktop pyfa-start.sh)

sha256sums=('73c26002d5c5961257ff39c5fd82a539250efdd22c2c2f1016f5250971d20231'
            'b54ef367e93d7916f6ef3106a27018571d35afc1aa9eadcccc79463050e70786'
            'ce006f4eb2c799dd88d38179847155737c716cddefa84c9dc3e79a9f64723aac')

package() {
  install -dm755 "${pkgdir}"/usr/share/pyfa

  install -Dm644 "${srcdir}"/"${_distname}"/config.py "${pkgdir}"/usr/share/pyfa
  install -Dm644 "${srcdir}"/"${_distname}"/eve.db "${pkgdir}"/usr/share/pyfa
  install -Dm755 "${srcdir}"/"${_distname}"/pyfa.py "${pkgdir}"/usr/share/pyfa
  install -Dm644 "${srcdir}"/"${_distname}"/README.md "${pkgdir}"/usr/share/pyfa

  cp -a "${srcdir}"/"${_distname}"/eos "${pkgdir}"/usr/share/pyfa
  cp -a "${srcdir}"/"${_distname}"/gui "${pkgdir}"/usr/share/pyfa
  cp -a "${srcdir}"/"${_distname}"/imgs "${pkgdir}"/usr/share/pyfa
  cp -a "${srcdir}"/"${_distname}"/service "${pkgdir}"/usr/share/pyfa
  cp -a "${srcdir}"/"${_distname}"/utils "${pkgdir}"/usr/share/pyfa
  
  install -dm755 "${pkgdir}"/usr/share/pixmaps
  install -Dm644 "${srcdir}"/"${_distname}"/imgs/gui/pyfa64.png "${pkgdir}"/usr/share/pixmaps/pyfa.png

  install -Dm644 "${srcdir}"/pyfa.desktop "${pkgdir}"/usr/share/applications/pyfa.desktop
  install -Dm755 "${srcdir}"/pyfa-start.sh "${pkgdir}"/usr/bin/pyfa
}

