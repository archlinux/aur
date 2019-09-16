# Maintainer Manuel Palenzuela <sadshinobi@protonmail.com>

author=sjl
pkgname=python-todo-t
_gitname=t
pkgver=0.r87.2491982
pkgrel=1
pkgdesc="Command-line todo list manager"
url="https://github.com/sjl/t.git"
makedepends=('git' 'python')
license=('GPL')
arch=('any')
source=("git+https://github.com/$author/$_gitname.git")
provides=('python-todo-t')

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_gitname"
    python setup.py install --root=$pkgdir
}

