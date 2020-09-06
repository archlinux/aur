# Maintainer: Soham Sen <aur at sohamsen dot me>
pkgname=swaglyrics
_name=SwagLyrics-For-Spotify
pkgver=1.2.2
pkgrel=1
pkgdesc="Get lyrics of currently playing Spotify song so you don't sing along with the wrong ones and embarrass yourself later. Very fast."
arch=('any')
url="https://github.com/SwagLyrics/SwagLyrics-For-Spotify"
license=('MIT')
depends=('python-swspotify' 'python-beautifulsoup4' 'python-colorama' 'python-unidecode')
makedepends=('python-setuptools')
source=("$_name-$pkgver.tar.gz::https://github.com/SwagLyrics/$_name/archive/v$pkgver.tar.gz")
sha256sums=('be57ac34b2f7ad2c100a29eef5f65cab38d3219fa86933fde57be064bbc2a027')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE.md
}
