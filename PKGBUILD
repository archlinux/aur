# Maintainer:

_pkgname="pdf-decrypt"
pkgname="$_pkgname"
pkgver=r14.c3a4fc9
pkgrel=1
pkgdesc="Remove password-protection from PDFs permanently."
arch=('any')
url="https://github.com/zvyn/pdf-decrypt"
license=('custom')
depends=('qpdf')
makedepends=('git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  install -vDm0755 "LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname"

  install -vDm0755 "$_pkgname.bash" -t "$pkgdir/usr/bin"
  install -vDm0755 "$_pkgname.png" -t "$pkgdir/usr/share/pixmaps"
  install -vDm0755 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
