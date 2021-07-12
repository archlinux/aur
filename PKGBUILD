# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=11447d606bf22397c49ecb7eca9536bd7e43b0be
pkgname=deemix
pkgver=3.0.3
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
sha512sums=('15b07986898729f88a6430a1881326e31219e95540d36544d3e489702484829a4c24e3e387bca1bfca32f40a568bca4a8d112c7fd03cc8d926fd0a016dd90d40')

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
