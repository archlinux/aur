pkgname=python-atheris-git
pkgver=r7.5f9cf01
pkgrel=1
pkgdesc="A Coverage-Guided, Native Python Fuzzer"
arch=(any)
url="https://github.com/google/atheris"
license=('MIT')
makedepends=('python-setuptools' 'pybind11')
depends=('python' 'compiler-rt')
source=("git+https://github.com/google/atheris.git")
sha256sums=('SKIP')

pkgver() {
 cd atheris
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd atheris
  python setup.py build
}

package() {
  cd atheris
  python setup.py install --root="$pkgdir/" --optimize=1
}
