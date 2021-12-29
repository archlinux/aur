# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=b983712086d3a2a9602e6946e19754e513fb73c4
pkgname=deemix
pkgver=3.6.4
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://git.freezerapp.xyz/RemixDev/deemix-py'
license=('GPL3')
depends=(
    'python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen'
    'python-spotipy' 'python-eventlet' 'python-deezer-py>=1.0.0'
)
makedepends=('python-setuptools')
source=("deemix.tar.gz::https://git.freezerapp.xyz/RemixDev/deemix-py/archive/$_commit.tar.gz")
sha512sums=('851342c20e02850daad663ee07d1d318dead5966be020e7a28fed3a118830d3ffeb5013f1dda05f7e599d025436b7a7eced51bc9e19026baa27f767d0fc28e7e')

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
