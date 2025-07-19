# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=chimera
pkgver=0.24.9
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
b2sums=('1748eee0ce80233fe663b8f3b9e60e86c9739cec6cd6481e4c0c10019cee6bdd5fece4d4f5e79615c9f767bab40e37535b2b59e8ac5f577a45cbd67d4e66e30c')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py build
}
package() {
        cd "$srcdir/$pkgname-$pkgver"
        python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
}
