# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=f0c3152ffa5b6fc8b5dfab3e19f8111f7d1bc8df
pkgname=deemix
pkgver=3.0.2
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
sha512sums=('b344a23806d8fabb327c7a3fba2cb7791cf48b2c2f02a8e295e8d96f9cbe55ead74eb2c0b8ab5e9ed710ed4206f718d07e831fb9141a81adaa5c57f448f97fc7')

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
