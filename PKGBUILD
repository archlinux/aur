# Maintainer: Mufeed Ali <fushinari@protonmail.com>

pkgname=python-googletrans-git
_author=ssut
_gitname=py-googletrans
pkgver=0.r115.4f7c079
pkgrel=1
pkgdesc="Free Google Translate API for Python. Git version."
arch=('any')
license=('MIT')
url="https://github.com/ssut/py-googletrans"
depends=(
  python-setuptools
  python-httpx
)
provides=('python-googletrans')
conflicts=('python-googletrans')
source=("git+https://github.com/$_author/$_gitname.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf '0.r%s.%s' \
      "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  python setup.py build
}

package() {
  cd "$_gitname"
  python setup.py install --root="$pkgdir" --optimize=1
}

