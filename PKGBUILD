# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Victor Häggqvist <victor a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds

pkgname=goboom-bin
_pkgname=goboom

pkgver=0.2
pkgrel=2
pkgdesc="A dmenu wrapper"
url="https://github.com/victorhaggqvist/goboom"
license=('GPL3')
arch=('x86_64')
depends=('dmenu')
makedepends=()

source=(https://github.com/victorhaggqvist/goboom/releases/download/v${pkgver}/goboom_linux_amd64.tar.xz)
sha512sums=('7200b4c43852c0651f2dd132664e68c515152c208096315acf717e41d356cd9e8dd7f5d714fb4584f368398939995cf4e92b921283ef7fa0d5d74bbbf0402439')

package() {
  cd "$srcdir"
  install -d $pkgdir/usr/bin
  install -m755 goboom $pkgdir/usr/bin/goboom
  install -m755 goboom_run $pkgdir/usr/bin/goboom_run
  install -d $pkgdir/usr/share/man/man1
  install -m644 docs/_build/man/goboom.1 $pkgdir/usr/share/man/man1
}
