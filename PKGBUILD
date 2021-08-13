# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=5d1102c6a70017abd27fa29fa6c7c7099428af1e
pkgname=deemix
pkgver=3.4.3
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://git.freezer.life/RemixDev/deemix-py'
license=('GPL3')
depends=(
    'python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen'
    'python-spotipy' 'python-eventlet' 'python-deezer-py>=1.0.0'
)
makedepends=('python-setuptools')
source=("https://git.freezer.life/RemixDev/deemix-py/archive/$_commit.tar.gz")
sha512sums=('5c3b4ae6f6af44c59d16d5a8173325a5e17d3d1d461aa02387dbd783f44a11fcfc3fbd40fdffc23af043c14c97e9ef0f2416f88e19fabbcc3e404be878cf1eb9')

pkgver() {
    cd deemix-py
    sed -En 's/^__version__ = "([0-9\.]+)"$/\1/p' deemix/__init__.py | tr -d '\n'
}

build() {
    cd deemix-py
    python setup.py build
}

package() {
    cd deemix-py
    python setup.py install --root="$pkgdir" --optimize=1
}
