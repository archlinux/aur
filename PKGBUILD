# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkfilebrowser' 'python2-tkfilebrowser')
_name=tkFileBrowser
pkgver=2.2.5
pkgrel=1
pkgdesc="File browser for Tkinter, alternative to tkinter.filedialog in linux with GTK bookmarks support."
url="https://github.com/j4321/tkFileBrowser"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_name-$pkgver.tar.gz::https://github.com/j4321/$_name/archive/v$pkgver.tar.gz")
sha512sums=('aa990fa75c4e437aaf38a69e40ea6dde1adc4f01c8b6b6a217ff36be48d223a83757d90e7bf567dd638a4e3b42b44e9c3cef7cdbcb26aa3552738b1b9799730a')

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
