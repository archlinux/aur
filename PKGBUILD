# Maintainer: Liam Greenough <beacon515@gmail.com>
# Contributer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=python2-midi
pkgver=0.2.3
pkgrel=2
pkgdesc="A feature-rich, hardware-independent MIDI toolkit for Python"
arch=(i686 x86_64)
url=https://github.com/vishnubob/python-midi
license=(MIT)
depends=(alsa-lib python2)
makedepends=(python2-setuptools swig)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('e40119ba1ae3bc129141bfd68ca0805aed9b82416a42ee9b2325d1be7e566428')
sha512sums=('3c7612af7625328b3c7ccecf541ca74c8dacd482b3448593d22a349f904f8e42d9a6dbf00891833113e4a56b46d87981371076beb62ae907f44d89e99c40afc5')

build() {
    cd ${pkgname//2}-$pkgver/
    python2 setup.py build    
}


package() {
    cd ${pkgname//2}-$pkgver/
    python2 setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
