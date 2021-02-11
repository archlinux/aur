# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkfilebrowser')
_name=tkFileBrowser
pkgver=2.3.2
pkgrel=2
pkgdesc="File browser for Tkinter, alternative to tkinter.filedialog in linux with GTK bookmarks support."
url="https://github.com/j4321/tkFileBrowser"
arch=('any')
license=('GPL3')
makedepends=('python' 'python-setuptools')
depends=('python' 'python-psutil' 'tk' 'python-babel')
source=("$_name-$pkgver.tar.gz::https://github.com/j4321/$_name/archive/v$pkgver.tar.gz")
sha512sums=('85427acdd80cb649cb7e39427ce09273cf12493a53d46bd77ff7d84d091d5173a6e09ed2d60a9d481853c4af8b147ff6f2b64df6c32052ce9a72d46e0aff8683')

build() {
    cd "${srcdir}/$_name-${pkgver}"
    python setup.py build
}

package() {
  cd "${srcdir}/$_name-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
