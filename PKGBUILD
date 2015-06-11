# Maintainer: John Reese <john@noswap.com>
# Upstream URL: https://github.com/jreese/nib
#
# For improvements/fixes to this package, please send a pull request:
# https://github.com/jreese/arch


pkgname=nib-git
pkgver=20131014
pkgrel=1
pkgdesc="static site generator"
arch=('any')
url="https://github.com/jreese/nib"
license=('MIT')
depends=('python-setuptools' 'python-sh' 'python-markdown' 'python-jinja' 'python-yaml')
makedepends=('git')

_gitroot="git://github.com/jreese/nib"
_gitname="nib"

source=("$_gitroot")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
