# Maintainer: Vyacheslav Konovalov <f4f7l1hvr@relay.firefox.com>

_path=07/43/fcadf5de8ee4839fd51814a0d082683efe4ae0b065b7be665dd188ee48da
pkgname=deemix
pkgver=2.0.4
pkgrel=1
pkgdesc='A barebone deezer downloader library'
arch=(any)
url='https://t.me/deemixcommunity'
license=('GPL3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-spotipy'
    'python-eventlet' 'python-deezer-py')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/$_path/deemix-$pkgver.tar.gz")
sha256sums=('564e29dda53fd04edca4a3fb0fef1569662a1ec1b94c17bc38e660c89ae283a9')

pkgver() {
    cd deemix-$pkgver
    sed -En 's/^__version__ = "([0-9\.]+)"$/\1/p' deemix/__init__.py | tr -d '\n'
}

build() {
    cd deemix-$pkgver
    python setup.py build
}

package() {
    cd deemix-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
