# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=44d018a8101fafa7ae5df949d3fecd9d4bff7b2d
pkgname=deemix
pkgver=3.4.1
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
sha512sums=('7b382aabcf7bd3ac83367c01facf7f96551b371eee660847d67b6dceb15e8db3e0d67fe122337fb48837330c6817a2683c9bc7c6dd3334ab406153b12ca0b562')

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
