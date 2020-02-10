# Maintainer: Mario O.M. <marioortizmanero@gmail.com>
pkgname=python-lyricwikia
pkgver=0.1.11
pkgrel=1
pkgdesc="LyricWikia API for song lyrics"
arch=("any")
url="http://github.com/enricobacis/lyricwikia"
license=("custom:MIT")
depends=("python" "python-six" "python-requests" "python-beautifulsoup4")
makedepends=("python-setuptools")
source=("https://github.com/enricobacis/lyricwikia/archive/$pkgver.tar.gz")
md5sums=('56ce5e17bc30897633864ad87bcf6d5f')

build() {
    cd "lyricwikia-$pkgver"
    python setup.py build
}

package() {
    cd "lyricwikia-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
