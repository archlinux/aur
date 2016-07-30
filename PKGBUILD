# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-guidata
pkgver=1.7.5
pkgrel=1
pkgdesc="Python library generating graphical user interfaces for easy dataset editing and display"
arch=('any')
url="http://code.google.com/p/guidata/"
license=('custom:CeCIL')
depends=('python2-pyqt')
optdepends=('python2-h5py: for HDF5 files I/O'
            'spyder: for array/dictionnary editors') 
makedepends=('python2-distribute' 'unzip')
options=(!emptydirs)

source=("https://github.com/PierreRaybaut/guidata/archive/v${pkgver}.tar.gz")
md5sums=('de906bde15e13fa03dd0a02cdcfd671f')

build() {
  cd "$srcdir"/guidata-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/guidata-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -Dm644 Licence_CeCILL_V2-en.txt "$pkgdir/usr/share/licenses/python2-guidata/LICENSE"
}

