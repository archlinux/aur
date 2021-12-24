# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=e94a3ab28f512aefaffda21c2d09663230594c5d
pkgname=deemix
pkgver=3.6.1
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
sha512sums=('14f90795a85bec3507d853888f8c125d792543bcb807770c183ea7456905b59b1d3ad762601ba2140b6ca3aedc49444067a2fd1173d691de3c4eadabb08ebbe7')

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
