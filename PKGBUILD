# Maintainer: Boris Yumankulov <boriabloger[at]protonmail[dot]com>

pkgname=portprotonqt
pkgver=0.1.8
pkgrel=1
pkgdesc="Modern GUI for managing and launching games from PortProton, Steam, and Epic Games Store"
arch=('any')
url="https://git.linux-gaming.ru/Boria138/PortProtonQt"
license=('GPL-3.0')
depends=('python-numpy' 'python-requests' 'python-babel' 'python-evdev' 'python-pyudev' 'python-orjson'
    'python-psutil' 'python-tqdm' 'python-vdf' 'pyside6' 'icoextract' 'python-pillow' 'perl-image-exiftool' 'xdg-utils' 'python-beautifulsoup4' 'python-websocket-client' 'cabextract' 'unzip' 'curl' 'unrar')
makedepends=('python-'{'build','installer','setuptools','wheel'})
source=("git+https://git.linux-gaming.ru/Boria138/PortProtonQt#tag=v$pkgver")
sha256sums=('6f9635847f5f2e9d44d12d81cce9a37fb9e56759183fe38a2f71df436855405b')

build() {
    cd "$srcdir/PortProtonQt"
	python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/PortProtonQt"
    python -m installer --destdir="$pkgdir" dist/*.whl
    cp -r build-aux/share "$pkgdir/usr/"
}
