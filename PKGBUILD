# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=d80702e94934e4436866a00ce3908882ebfde081
pkgname=deemix
pkgver=3.0.4
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
sha512sums=('0b91479be0c30f0847a9d87533705c70049dc35e9fe8e1a5266e0403ce1a01256826016cd141ffd3ca3632d8225e3ffe7117956262c48cffe431650e4157e989')

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
