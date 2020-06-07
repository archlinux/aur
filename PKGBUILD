# Maintainer: gm3k4g <thingstuffet@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=(openal119-bin)
pkgver=1.19.1
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation"
arch=(x86_64)
url="https://github.com/kcat/openal-soft"
license=(LGPL)
depends=(glibc)
conflicts=(openal)
source=("openal119bin.pkg.tar.xz::https://github.com/gm3k4g/file_place/raw/master/openal-1.19.1-1-x86_64.pkg.tar.xz")
sha512sums=('7ccc7467087e92136aaf015e0cda0867d10eabe66dfad3378f50a891b9b3e71fc4f3358a04e249ef00778056f34a6d60e755f6e73be773afe1a21923895c46c0')

package() {
  optdepends=('qt5-base: alsoft-config GUI Configurator'
              'fluidsynth: MIDI rendering')
  provides=("openal=$pkgver")
  conflicts=("openal")

  install -d "$pkgdir/usr/share/"
  cp -rf "$srcdir/usr/share/" "$pkgdir/usr/"

  install -d "$pkgdir/usr/bin"
  cp -rf "$srcdir/usr/bin/" "$pkgdir/usr/"

  install -d "$pkgdir/usr/include/AL"
  cp -rf "$srcdir/usr/include/AL/" "$pkgdir/usr/include/"

  install -d "$pkgdir/usr/lib/"
  cp -rf "$srcdir/usr/lib/" "$pkgdir/usr/"
}
