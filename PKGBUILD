# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=43112e28eb3af3efab06830c009e659819c4732a
pkgname=deemix
pkgver=3.3.3
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
sha512sums=('26d9ce8aab5f5500a1e0e217addd97f2f3d194b9c39c65b2bdf76f3e29e0eaa3f3423e7c6a38ca93a27aa2d6bef09551412ee0389c4d03eabdd5c2cf97a62132')

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
