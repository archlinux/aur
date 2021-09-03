# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=c8bda282d17ed13675464b1cba322dd3227157e8
pkgname=deemix
pkgver=3.4.4
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
sha512sums=('91e2d0cf3733d6e3c5b34c00b689c6b5e3a070d18762d9e34b6463d512fc0173c7e353b3789b011aeff0848990b12e22ae7a23abd59842683ff18cf827a7d1c8')

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
