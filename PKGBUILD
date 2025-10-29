# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Anders Thomsen <mail nospamat andersthomsen nospamdot dk>

_pkgname=m-air-edit
pkgname=$_pkgname-bin
pkgver=1.8.1
pkgrel=2
pkgdesc='Remote control program for Midas M-AIR digital hardware mixers'
arch=(x86_64 armv7h)
url='https://www.midasconsoles.com/downloads.html'
license=('LicenseRef-MUSIC Group End User License Agreement')
depends=(gcc-libs glibc alsa-lib curl freetype2 libglvnd)
provides=($_pkgname)
conflicts=($_pkgname)
source=("EULA_2012-09-12.pdf"
        "m-air-edit.desktop"
        "M-AIR-Edit_icon.png")
source_x86_64=("https://cdn.mediavalet.com/aunsw/musictribe/7mM1k8DyEUmMITfnG4jjew/g35VNU0fCEy8pKcJ7lMC4A/Original/M-AIR-Edit_LINUX_${pkgver}.tar.gz")
source_armv7h=("https://cdn.mediavalet.com/aunsw/musictribe/zfrRRQ8Hq06-0DRXhEQk1g/Dl-iX3UM_E-tWyh2lZu7mA/Original/M-AIR-Edit_RASPI_${pkgver}.tar.gz")
sha256sums=('3321aa0b3e208133094665281a6fc2ca001628858cd1a6388185eac93569fca8'
            '7f88a5afac7e4097524797a7776f2a6619f4dae8d0cc6449fbb2e118fb6c1a7b'
            '6ead06b892d79e7cecddf89b189de1bc46476be33f88270b2ba86f0f0e96d5cb')
sha256sums_x86_64=('bd81ca4b10cf7fa6b056f27324a0f6ab4e5beed0dbb55c2f396def245c8fa6d2')
sha256sums_armv7h=('4954f957cbfde0d5c08685e01bf9a3f4f3e4f1e5d1ec6fa0df14df42ff5c528b')


package() {
  # binary
  install -Dm755 "$srcdir"/M-AIR-Edit -t "$pkgdir"/usr/bin
  ln -sf M-AIR-Edit "$pkgdir"/usr/bin/$_pkgname
  # .desktop file
  install -Dm644 "$srcdir"/$_pkgname.desktop \
    -t "$pkgdir"/usr/share/applications
  # icon
  install -Dm644 "$srcdir"/M-AIR-Edit_icon.png \
    "$pkgdir"/usr/share/icons/$_pkgname.png
  # Release notes
  install -Dm644 "$srcdir"/*Releasenotes.pdf \
    -t "$pkgdir"/usr/share/doc/$pkgname
  # EULA
  install -Dm644 "$srcdir"/EULA_2012-09-12.pdf \
    "$pkgdir"/usr/share/licenses/$pkgname/license.pdf
}
