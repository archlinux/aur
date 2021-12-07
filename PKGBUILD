# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=doomretro
pkgver=4.4.1
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('x86_64' 'aarch64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer' 'glibc')
makedepends=('cmake')
optdepends=('timidity++: for music playback')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha512sums=('0f7fb3ab62ffe890cebe0523674459fef9a9b682cbe6ff51d1c5142060a03269c6504deceb58bc5e1ffff79ad9495d936a0d557268f6043c0f32095fc69bc990')
b2sums=('680da5a170a065114799fa1071a2e9a34efcd3097c1d50f145e4c952f4edb7288c7acf5e1964c23865dac2c734bb08d30bab0932f686e0fc401a0dfb53a81c2a')

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
