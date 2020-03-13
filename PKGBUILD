# Maintainer: loathingkernel <username ta gmail tod com>

pkgname=python-pandasvault-git
pkgver=0.r74.53e7077
pkgrel=1
pkgdesc="Advanced Pandas Vault — Utilities, Functions and Snippets."
arch=('x86_64')
url="https://github.com/firmai/pandasvault"
license=('MIT')
depends=('python-pandas' 'python-numpy' 'python-scikit-learn' 'python-setuptools')
makedepends=('python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("pandasvault::git+https://github.com/firmai/pandasvault.git")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir"/pandasvault
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir"/pandasvault
  python setup.py build
}

package() {
  cd "$srcdir"/pandasvault
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  #install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
