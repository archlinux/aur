# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=9906043b3142c1aeebd001680997fca1d95e16b7
pkgname=deemix
pkgver=3.5.5
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
sha512sums=('9a1cf6d7325b69500e250b11e8f8df26d21be4961d00e3a4e1df1ae50ce79360500a977f3add5c22cae1fd100f9214b4c1cd5781d44517bae37251813c51459f')

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
