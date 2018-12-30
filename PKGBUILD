# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Kochetkov Andrey <gornet@gmail.com>
# Contributor: Fabian Schoelzel <myfirstname.mylastname@googlemail.com>

pkgname=pyfa
pkgver=2.7.0
pkgrel=1
_distname="Pyfa-${pkgver}"
pkgdesc="EVE Online Fitting Assistant"
arch=('any')
url="https://github.com/pyfa-org/Pyfa"
license=('GPL3')
makedepends=('python-pip')
depends=('python' 'python-wxpython' 'python-logbook' 'python-matplotlib' 'python-dateutil' 'python-requests' 'python-sqlalchemy' 'python-cryptography' 'python-markdown2' 'python-packaging' 'python-beautifulsoup4' 'python-pyaml' 'python-diskcache' 'python-roman')
optdepends=()
source=(https://github.com/pyfa-org/Pyfa/archive/v$pkgver.tar.gz pyfa.desktop pyfa-start.sh)

sha256sums=('3a43e8eda8384d2e5aa3cbe61e23b1e7ead85e0138df2f1667c9ba1d454413e1'
            'b54ef367e93d7916f6ef3106a27018571d35afc1aa9eadcccc79463050e70786'
            '0fa4a1cb835ddbb764957cd00426f9bfa52b17bcb6d5dc7428afc256da5e01da')

package() {
  install -dm755 "${pkgdir}"/usr/share/pyfa
  install -dm755 "${pkgdir}"/usr/share/licenses/pyfa

  install -Dm644 "${srcdir}"/"${_distname}"/config.py "${pkgdir}"/usr/share/pyfa
  install -Dm644 "${srcdir}"/"${_distname}"/eve.db "${pkgdir}"/usr/share/pyfa
  install -Dm755 "${srcdir}"/"${_distname}"/pyfa.py "${pkgdir}"/usr/share/pyfa
  install -Dm644 "${srcdir}"/"${_distname}"/README.md "${pkgdir}"/usr/share/pyfa

  install -Dm644 "${srcdir}"/"${_distname}"/LICENSE "${pkgdir}"/usr/share/licenses/pyfa

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

