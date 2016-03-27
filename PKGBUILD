# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: Victor Häggqvist <victor a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds

pkgname=goboom-bin
_pkgname=goboom

pkgver=0.2.1
pkgrel=1
pkgdesc="A dmenu wrapper"
url="https://github.com/victorhaggqvist/goboom"
license=('GPL3')
arch=('x86_64')
depends=('dmenu')
makedepends=()

source=(https://bintray.com/artifact/download/atriix/generic/goboom_${pkgver}_linux_amd64.tar.gz)
sha256sums=('4678525a0227fb4078f849b3ff3a7266680d7825af6b783266f33926e79d8430')

package() {
  cd "$srcdir/goboom_${pkgver}_linux_amd64"
  install -d $pkgdir/usr/bin
  install -m755 goboom $pkgdir/usr/bin/goboom
  install -m755 goboom_run $pkgdir/usr/bin/goboom_run
  install -d $pkgdir/usr/share/man/man1
  install -m644 docs/_build/man/goboom.1 $pkgdir/usr/share/man/man1
}
