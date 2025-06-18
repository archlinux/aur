# Maintainer: Thomas hitthomas28@gmail.com
pkgname=mathsqt
pkgver=1.0.3 
pkgrel=1
pkgdesc="A comprehensive CLI math tool written in Python."
arch=('any')
url="https://github.com/ThomasSimpDev/Mathsqt"
license=('GPL3')  # Change to your license
depends=(
    'python-rich'
    'python-sympy'
    'python-numpy'
    'python-pyfiglet'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("git+https://github.com/ThomasSimpDev/Mathsqt.git#tag=v$pkgver")
sha256sums=('SKIP')  # For git builds

build() {
    cd "$srcdir/Mathsqt"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/Mathsqt"
    python -m installer --destdir="$pkgdir" dist/*.whl  
}
