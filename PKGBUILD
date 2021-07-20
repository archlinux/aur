# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=092e96f4bd0bfe319390cb7474914e6ece10b58b
pkgname=deemix
pkgver=3.2.0
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
sha512sums=('fee58f9010f6418a4a9725726bf7310fa08259a4b6d306c91de58e76d35edf0d02662dc2784faaad72c7cf892f098e894d78ba88983cb0d5347f2a9406fb5773')

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
