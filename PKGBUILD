# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=snd-hdspe-dkms
pkgver=1.0
pkgrel=3
pkgdesc='A linux kernel module for RME HDSPe sound cards and extension modules'
url='https://github.com/Schroedingers-Cat/snd-hdspe'
arch=('any')
license=('GPL-3.0-or-later')
depends=('dkms')
provides=("snd-hdspe=${pkgver}-${pkgrel}")

source=(
  "https://github.com/Schroedingers-Cat/snd-hdspe/archive/refs/heads/support-v6.2.zip"
  "dkms.conf"
)
sha256sums=('5b71f139406177d674e8dd1370cf36f7096bc417fb29464d59fc57b8f3990c45'
            '483e544884808f5e3c5e8fd22c12eef3297479c4db67909e85714dbe5d5771cd')

_sourcedir="snd-hdspe-support-v6.2"

package() {
  cd "$srcdir/$_sourcedir"
  install -Dm644 Makefile "$pkgdir/usr/src/snd-hdspe-${pkgver}/Makefile"
  install -Dm644 "$srcdir/dkms.conf" "$pkgdir/usr/src/snd-hdspe-${pkgver}/dkms.conf"
  install -Dm644 sound/pci/hdsp/Makefile "$pkgdir/usr/src/snd-hdspe-${pkgver}/sound/pci/hdsp/Makefile"
  install -Dm644 sound/pci/hdsp/hdspe/Makefile "$pkgdir/usr/src/snd-hdspe-${pkgver}/sound/pci/hdsp/hdspe/Makefile"
  install -Dm644 sound/pci/hdsp/hdspe/*.{c,h} -t "$pkgdir/usr/src/snd-hdspe-${pkgver}/sound/pci/hdsp/hdspe"
}

# vim: ts=2 sw=2 et:
