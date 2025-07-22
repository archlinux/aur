# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=chimera
pkgver=0.24.10
pkgrel=1
pkgdesc="Configure and manage games in Steam"
arch=('any')
url="https://github.com/chimeraos/chimera"
license=('MIT')
provides=('steam-tweaks' 'steam-buddy')
conflicts=('steam-tweaks' 'steam-buddy')
depends=('python' 'python-bottle' 'python-pyftpdlib' 'python-yaml' 'python-vdf' 'python-inotify-simple' 'python-requests' 'python-beaker' 'python-pyglet' 'python-bcrypt' 'python-psutil' 'python-pyudev' 'python-plyvel' 'python-waitress' 'python-gbopyrator' 'retroarch' 'libretro-genesis-plus-gx' 'libretro-mgba' 'libretro-nestopia' 'libretro-snes9x' 'libretro-mupen64plus-next' 'libretro-beetle-pce-fast' 'libretro-flycast' 'libretro-beetle-psx-hw' 'libretro-kronos' 'libretro-mame' 'libretro-dolphin' 'libretro-desmume' 'libretro-picodrive' 'libretro-mesen-s' 'dolphin-emu' 'flatpak' 'xdotool' 'xorg-xprop' 'xorg-xwininfo' 'xorg-xdpyinfo' 'wireplumber' 'legendary' 'ttf-dejavu' 'innoextract' 'mesa-utils' 'yq')
optdepends=('acsccid' 'libnfc' 'libretro-stella2014-git' 'libretro-opera-git' 'libretro-prosystem-git' 'libretro-citra' 'python-pyscard' 'steam-removable-media-git' 'wyvern' 'libretro-lrps2-git') # compiling cores takes a long time, so make them optional
source=("$pkgname-$pkgver.tar.gz::https://github.com/chimeraos/$pkgname/archive/$pkgver.tar.gz")
b2sums=('3adfd9002b0b476b216dfdd21a887659240b9a849997e346ae1806e1331b60f3614a750bb466d13c1a81e61db841137d23510e70159c75478690776bcbe959c3')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py build
}
package() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
}
