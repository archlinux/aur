# Maintainer: Husam Bilal <husam212@gmail.com>

pkgname=dotfiles-git
_pkgname=dotfiles
pkgver=r358.8998a93
pkgrel=1
pkgdesc='A tool to make managing your dotfile symlinks in $HOME easy, allowing you to keep all of them in a single directory.'
url='https://github.com/jbernard/dotfiles'
license=('ISC')
arch=('any')
depends=('python' 'python-py')
makedepends=('git' 'python-setuptools')
conflicts=('dotfiles')
provides=('dotfiles')
source=('git+https://github.com/jbernard/dotfiles.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root=$pkgdir
}
