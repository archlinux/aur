# Maintainer: Egor Kovetskiy <e.kovetskiy@gmail.com>
pkgname=python-todo-t
pkgver=0
pkgrel=1
pkgdesc="Command-line todo list manager"
url="https://github.com/kovetskiy/t"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('python')

source=("git://github.com/sjl/t.git")
md5sums=('SKIP')
backup=()

pkgver() {
    cd "t"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "t"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
