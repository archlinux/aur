# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

author=PixxxeL
pkgname=python-html-purifier-git
_gitname=python-html-purifier
pkgver=0.r26.00f38b6
pkgrel=1
pkgdesc='A Python module to purify HTML.'
url='https://github.com/PixxxeL/python-html-purifier.git'
arch=('any')
license=('GPL')
depends=('python')
makedepends=('git')
provides=('python-html-purifier')

source=("git+https://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  python setup.py install --root=$pkgdir
}
