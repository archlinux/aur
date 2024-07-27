# Contributor: John Reese <john@noswap.com>

pkgname=nib-git
pkgver=20231224
pkgrel=1
pkgdesc="static site generator"
arch=('any')
url="https://github.com/jreese/nib"
license=('MIT')
depends=('python-sh' 'python-markdown' 'python-jinja' 'python-yaml')
makedepends=('git' 'python-setuptools')

_gitroot="git+https://github.com/jreese/nib"
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
