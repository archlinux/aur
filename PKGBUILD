python_pkgname=tarsafe
pkgname=python-${python_pkgname}
pkgver=0.0.5
pkgrel=1
pkgdesc="A safe subclass of the TarFile class for interacting with tar files. Can be used as a direct drop-in replacement for safe usage of extractall()"
arch=(any)
url="https://github.com/beatsbears/tarsafe/"
license=(MIT)
makedepends=("python" "python-pip")
source=(git+https://github.com/beatsbears/tarsafe.git#branch=v${pkgver})
sha256sums=(SKIP)
build() {
  cd "$python_pkgname"
  python setup.py build
}
package() {
  cd "$python_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}
