# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python-wasmtime
pkgver=0.3.0
pkgrel=1
pkgdesc="Python 3 extension for interface with Wasmtime/Cranelift."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/CraneStation/wasmtime"
license=('APACHE2')
depends=('python' 'python-setuptools' 'python-wheel' 'python-setuptools-rust')
makedepends=('rustup')
options=(!emptydirs)
source=("https://github.com/CraneStation/wasmtime/archive/v${pkgver}.tar.gz")
sha384sums=('c043bf58f24a174d832b14b4aa1a6de17cd608648753da65c64f33254e79df913ce0e709abcd9645e71ebed4c2134360')

package() {
    cd "$srcdir/wasmtime-${pkgver}/misc/wasmtime-py"
    rustup run nightly python setup.py install --root="$pkgdir/" --optimize=1
}
