# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=7838d4eefea902d44e0dd0cdb77a10cddd2539c2
pkgname=deemix
pkgver=3.2.2
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
sha512sums=('a8afe4d4a96ebc2b74224a9a557c31815408cb61a5845d3d4d4699ab876c2f97c7b993dbff2a8913d35abb486446c4f79a3fc9c276beb6df3c7af1fd48b147fa')

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
