# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkfilebrowser' 'python2-tkfilebrowser')
_name=tkFileBrowser
pkgver=2.3.0
pkgrel=1
pkgdesc="File browser for Tkinter, alternative to tkinter.filedialog in linux with GTK bookmarks support."
url="https://github.com/j4321/tkFileBrowser"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$_name-$pkgver.tar.gz::https://github.com/j4321/$_name/archive/v$pkgver.tar.gz")
sha512sums=('8d674ed05ed15f323aca07f76359d316cbcc6761e9d45455779ee163a7628da42a312cb8e8723ae52cd14a01008cba27431aee9d3a073fab1955716350e6bd4d')

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
