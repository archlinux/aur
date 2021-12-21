# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=55383332f8086ef9baf5dbfe1198afc1d0f1b3ce
pkgname=deemix
pkgver=3.5.7
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
sha512sums=('7fdd8ea68cb5a19b8ee9b51b68905729d9d09e9884e287716d7e42b6f4629d80dd7858cd9ccaf20b11139960e1a3d0401f08db6b3b4f3c7631804d5e87ee11df')

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
