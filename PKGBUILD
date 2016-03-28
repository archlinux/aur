# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Victor Häggqvist <victor a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds

pkgname=goose-bin
_pkgname=goose

pkgver=0.1.1
pkgrel=1
pkgdesc="A cli-webserver"
url="https://github.com/victorhaggqvist/goose"
license=('MIT')
arch=('x86_64')
depends=()
makedepends=()

source=(https://bintray.com/artifact/download/atriix/generic/${_pkgname}_${pkgver}_linux_amd64.tar.gz)
sha256sums=('acceeb97269580c1aa2f016514dbf159d8078a4924ec82b065bf3f72ea604cf5')

package() {
  cd "$srcdir/${_pkgname}_${pkgver}_linux_amd64"
  install -d $pkgdir/usr/bin
  install -m755 $_pkgname $pkgdir/usr/bin/$_pkgname
  install -d $pkgdir/usr/share/man/man1
  install -m644 docs/_build/man/$_pkgname.1 $pkgdir/usr/share/man/man1
}
