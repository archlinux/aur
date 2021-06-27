# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=f530a4e89f930fb36db2ee2b9a4454bce825d3c9
pkgname=deemix
pkgver=3.0.0
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://git.freezer.life/RemixDev/deemix-py'
license=('GPL3')
depends=(
    'python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen'
    'python-spotipy' 'python-eventlet' 'python-deezer-py'
)
makedepends=('python-setuptools')
source=("https://git.freezer.life/RemixDev/deemix-py/archive/$_commit.tar.gz")
sha512sums=('beb7e1d984022e42a227c1113e7a6b90a5925b9e02abaf0770470d0662bbf8d0b69294bf0a6331275c50dd864322e6afb82afa3ffb3b6bcb9319fec6a12b2788')

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
