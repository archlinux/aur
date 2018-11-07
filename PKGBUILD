# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkfilebrowser' 'python2-tkfilebrowser')
_name=tkFileBrowser
pkgver=2.2.6
pkgrel=1
pkgdesc="File browser for Tkinter, alternative to tkinter.filedialog in linux with GTK bookmarks support."
url="https://github.com/j4321/tkFileBrowser"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_name-$pkgver.tar.gz::https://github.com/j4321/$_name/archive/v$pkgver.tar.gz")
sha512sums=('e6583f40c83ced63b0eccc50627f9a27068cbbfb1de4e859bb88c49d2dae2230327e5866a9af09e8833632cbb871e16c9ddc0591288f0c1305fc692068edbf62')

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
