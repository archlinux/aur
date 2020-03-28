# Maintainer: Eugene Lebedev <satanych13@gmail.com>

pkgname=libretro-pcsx2
pkgver=1.1.1
pkgrel=1
pkgdesc="Launch Sony PlayStation 2 games through PCSX2, directly from RetroArch."
arch=('x86_64')
url="https://github.com/coldscientist/libretro-pcsx2-launcher"
license=('MIT')
depends=('pcsx2' 'libretro-core-info')
groups=('libretro')
source=("libretro-pcsx2::https://github.com/coldscientist/libretro-pcsx2-launcher/archive/$pkgver.tar.gz")
sha256sums=(223894a0342be428f21914e8398cbc95f5dc394fcef66c848ebbe414a1259bdd)
_dir="libretro-pcsx2-launcher-$pkgver"

build() {
  cd $_dir
  make
}

package() {
  install -Dm644 $_dir/dolphin_launcher_libretro.so "${pkgdir}/usr/lib/libretro/pcsx2_launcher_libretro.so"
  install -Dm644 $_dir/dolphin_launcher_libretro.info "${pkgdir}/usr/share/libretro/info/pcsx2_launcher_libretro.info"
}

