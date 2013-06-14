# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
_gitname=aov-html2epub
pkgname=$_gitname-git
pkgver=32.e05f223
pkgrel=1
pkgdesc='Minimal HTML to EPUB format converter.'
arch=(any)
url='https://github.com/angelortega/aov-html2epub'
license=('public domain')
depends=('bash')
makedepends=('git')
provides=($_gitname)
source=("$_gitname::git+https://github.com/angelortega/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$_gitname"
  install -d "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr/bin" install
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -t "$pkgdir/usr/share/doc/$pkgname" README
}

# vim:set ts=2 sw=2 et:
