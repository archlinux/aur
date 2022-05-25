# Maintainer: José Joaquín Zubieta Rico <flyingspaghetti@airmail.cc>

pkgname='harvest-bin'
pkgver=0.8
pkgrel=1
pkgdesc='Tool to sort large collections of files according to common typologies'
arch=('x86_64')
url='https://github.com/dyne/harvest'
license=('GPL3')
depends=('gcc-libs')
conflicts=('harvest')
source=(https://github.com/dyne/harvest/releases/download/v${pkgver}/harvest.elf)
sha512sums=('1912bc5019dc4f1a55855cfcc589e9b248b23dee182155f296d0160f76bd30989ba2b103036a78fca2d3784fd4c3627f741a52afc4d45d305dace4ca695b2019')
_prefix=usr

prepare() {
    mv harvest.elf harvest
}

package() {
  install -Dm755 harvest "$pkgdir/$_prefix/bin/harvest"
}

