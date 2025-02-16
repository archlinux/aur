# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=chimera
pkgver=0.24.0
pkgrel=1
pkgdesc="Configure and manage games in Steam"
arch=('any')
url="https://github.com/chimeraos/chimera"
license=('MIT')
provides=('steam-tweaks' 'steam-buddy')
conflicts=('steam-tweaks' 'steam-buddy')
depends=('python' 'python-bottle' 'python-pyftpdlib' 'python-yaml' 'python-vdf' 'python-inotify-simple' 'python-requests' 'python-beaker' 'python-pyglet' 'python-bcrypt' 'python-psutil' 'python-pyudev' 'python-plyvel' 'python-waitress' 'python-gbopyrator' 'retroarch' 'libretro-genesis-plus-gx' 'libretro-mgba' 'libretro-nestopia' 'libretro-snes9x' 'libretro-mupen64plus-next' 'libretro-beetle-pce-fast' 'libretro-flycast' 'libretro-beetle-psx-hw' 'libretro-pcsx2' 'libretro-kronos' 'libretro-mame' 'libretro-dolphin' 'libretro-desmume' 'libretro-picodrive' 'libretro-mesen-s' 'dolphin-emu' 'flatpak' 'xdotool' 'xorg-xprop' 'xorg-xwininfo' 'xorg-xdpyinfo' 'wireplumber' 'legendary' 'ttf-dejavu' 'innoextract' 'mesa-utils' 'yq')
optdepends=('acsccid' 'libnfc' 'libretro-stella2014-git' 'libretro-opera-git' 'libretro-prosystem-git' 'libretro-citra' 'python-pyscard' 'steam-removable-media-git' 'wyvern') # compiling cores takes a long time, so make them optional
source=("$pkgname-$pkgver.tar.gz::https://github.com/chimeraos/$pkgname/archive/$pkgver.tar.gz")
b2sums=('c17892676efec5f116ac1efee6af4d56d3fb205af82c943848b4e1a0f341c11ddc1ee35fe79a1d709de787fa7d49d349eed30ccd209d4cd49a0e1c6cc42f0981')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py build
}
package() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
}
