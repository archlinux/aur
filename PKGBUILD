# Maintainer: Fabian Zaremba <fabian@youremail.eu>

pkgname=jupyterlab-git
pkgver=v0.1.3.0.r56.g6f73639
pkgrel=1
pkgdesc="A pre-alpha Jupyter lab environment notebook server extension."
url="http://jupyter.org"
depends=('python')
makedepends=('python3' 'npm' )
license=('BSD')
conflicts=('jupyterlab')
provides=('jupyterlab')
arch=('any')
source=('git+https://github.com/jupyter/jupyterlab.git')
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/jupyterlab"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/jupyterlab"
    python setup.py build
}

package() {
    cd "$srcdir/jupyterlab"
    python setup.py install --root="$pkgdir" --optimize=1 
}
