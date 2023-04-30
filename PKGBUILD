# Mantainer: Dudemanguy <random342@airmail.cc>

pkgname=password-sanity-git
_pkgname=password-sanity
pkgver=0.50_2_g34994fd
pkgrel=1
license=("GPL3")
pkgdesc="A simple, python program for securely managing passwords through the command line"
depends=("python" "python-gnupg" "python-pyperclip")
makedepends=("python-build" "python-installer")
arch=("x86_64")
url="https://github.com/Dudemanguy/password-sanity"
source=("${_pkgname}::git+https://github.com/Dudemanguy/password-sanity.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --tags)" | sed s/-/_/g
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
