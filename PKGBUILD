# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=chimera
pkgver=0.24.11
pkgrel=1
pkgdesc="Configure and manage games in Steam"
arch=('any')
url="https://github.com/chimeraos/chimera"
license=('MIT')
provides=('steam-tweaks' 'steam-buddy')
conflicts=('steam-tweaks' 'steam-buddy')
depends=(
  'dolphin-emu'
  'flatpak'
  'innoextract'
  'legendary'
  'libretro-beetle-pce-fast'
  'libretro-beetle-psx-hw'
  'libretro-desmume'
  'libretro-dolphin'
  'libretro-flycast'
  'libretro-genesis-plus-gx'
  'libretro-kronos'
  'libretro-mame'
  'libretro-mesen-s'
  'libretro-mgba'
  'libretro-mupen64plus-next'
  'libretro-nestopia'
  'libretro-picodrive'
  'libretro-snes9x'
  'mesa-utils'
  'python'
  'python-bcrypt'
  'python-beaker'
  'python-bottle'
  'python-gbopyrator'
  'python-inotify-simple'
  'python-plyvel'
  'python-psutil'
  'python-pyftpdlib'
  'python-pygame'
  'python-pyudev'
  'python-requests'
  'python-vdf'
  'python-waitress'
  'python-yaml'
  'retroarch'
  'ttf-dejavu'
  'wireplumber'
  'xdotool'
  'xorg-xdpyinfo'
  'xorg-xprop'
  'xorg-xwininfo'
  'yq'
)

# compiling some cores takes a long time, so make them optional
optdepends=(
  'acsccid'
  'libnfc'
  'libretro-citra'
  'libretro-lrps2-git'
  'libretro-opera-git'
  'libretro-prosystem-git'
  'libretro-stella2014-git'
  'python-pyscard'
  'steam-removable-media-git'
  'wyvern'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/chimeraos/$pkgname/archive/$pkgver.tar.gz")
b2sums=('94d266cfa258dd918bf18b6c4c5ef6f8f3fe1b78ef05493792068656665073761b5727eead33aa764116c0ce50795ee2ef3d7fc5e691cb332f20c9bdeb43ebae')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py build
}
package() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
}
