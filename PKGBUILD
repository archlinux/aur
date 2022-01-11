# Maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>

_commit=5f978acec7feea53aead493ee2b916ff99a811df
pkgname=deemix
pkgver=3.6.6
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
source=("deemix.tar.gz::https://git.freezerapp.xyz/RemixDev/deemix-py/archive/$_commit.tar.gz")
sha512sums=('733957190373b40ef559b42d84fc07ea6e343b53d65560788fd915cf7915f9de8b2c0866b84be56890ef740fd53a5abbffcf928d5f9903109dc0273b95a11509')

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
