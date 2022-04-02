# Contributor: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=termpalette-git
pkgver=r20.11de51f
pkgrel=1
epoch=1
pkgdesc="Terminal ANSI color palette viewer written in python"
arch=(any)
url="https://github.com/sseemayer/TermPalette"
license=('MIT')
depends=('python')
makedepends=('git')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd TermPalette
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd TermPalette
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
