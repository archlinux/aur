# Maintainer: Sving1024 <sving1024@outlook.com>

_name=xeger
pkgname=python-$_name-git
pkgver=r40.e650ded
pkgrel=1
pkgdesc="A library for generating random strings from a valid regular expression."
license=('BSD')
arch=('any')
url="https://github.com/crdoconnor/xeger"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("${_name}::git+https://github.com/crdoconnor/xeger.git")
sha256sums=('SKIP')
provides=('python-xeger')
conflicts=('python-xeger')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd $_name
    python setup.py build
}

package() {
    cd $_name
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE.txt $pkgdir/usr/share/license/python-accesser/LICENSE.txt
}
