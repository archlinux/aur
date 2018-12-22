# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkfilebrowser' 'python2-tkfilebrowser')
_name=tkFileBrowser
pkgver=2.3.1
pkgrel=1
pkgdesc="File browser for Tkinter, alternative to tkinter.filedialog in linux with GTK bookmarks support."
url="https://github.com/j4321/tkFileBrowser"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_name-$pkgver.tar.gz::https://github.com/j4321/$_name/archive/v$pkgver.tar.gz")
sha512sums=('90f0a82b8bb330ea2d66195e7f96d9afe982501935bfa7acecd4813232f0098de902951f48f0f56044a91cafd0979975be6f0cd60fada84aacd6402f45442b87')

build() {
    cd "${srcdir}/$_name-${pkgver}"
    python setup.py build
}

package_python-tkfilebrowser() {
  depends=('python-psutil' 'tk' 'python-babel')
  cd "${srcdir}/$_name-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

package_python2-tkfilebrowser() {
  depends=('python2-psutil' 'tk'  'python2-babel')
  cd "${srcdir}/$_name-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
