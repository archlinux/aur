# Maintainer: Moritz Lipp <mail@mlq.me>
pkgname=pysheng-git
pkgver=r41.3fcda63
pkgrel=1
pkgdesc="CLI and GUI program to download pages from Google Books as PNG images"
arch=('x86_64' 'i686')
url="https://github.com/tokland/pysheng"
license=('GPL')
depends=('python2')
makedepends=('git')
optdepends=('python2-reportlab: GUI'
	    'pygtk: GUI')
conflicts=('pysheng' 'pysheng-svn')
source=('pysheng::git+https://github.com/tokland/pysheng')
md5sums=('SKIP')
_gitname=pysheng

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
