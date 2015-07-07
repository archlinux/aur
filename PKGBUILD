# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-guidata
pkgver=1.6.1
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

source=(http://guidata.googlecode.com/files/guidata-$pkgver.zip)
md5sums=('47d625f998b5092ba797c8657979aa94')

build() {
  cd "$srcdir"/guidata-$pkgver

  python2 setup.py build
}

package() {
  cd "$srcdir"/guidata-$pkgver

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -Dm644 Licence_CeCILL_V2-en.txt "$pkgdir/usr/share/licenses/python2-guidata/LICENSE"
}

