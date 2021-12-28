# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=724a7affa60ae9989e6ea2ad20d2df8f1f3a4b9f
pkgname=deemix
pkgver=3.6.3
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
source=("https://git.freezerapp.xyz/RemixDev/deemix-py/archive/$_commit.tar.gz")
sha512sums=('a0f4fa9b6241a8dfd79babcea14c4d46f868b8a7f916c5e8a3d731a83e2694e7741ba15d779a3ca0203e84ad6ee517debe62845a6db2dbd2a26a821a7e3581c7')

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
