# Contributor: Gleb Liutsko <gleb290303@gmail.com>

pkgname=spolyrics
pkgver=1.0.4
pkgrel=2
pkgdesc="Displays the lyrics to the currently playing song"
arch=('any')
url="https://github.com/glebliutsko/spolyrics"
license=('MIT')
depends=('python' 'python-requests' 'python-pyqt5' 'python-pyqt5-webengine' 'python-yandex-music-api' 'python-lyricsgenius')
makedepends=('python-setuptools')
source=("https://github.com/glebliutsko/$pkgname/releases/download/$pkgver/$pkgname-$pkgver-py3-none-any.whl"
        'spolyrics.desktop')
md5sums=('06bbaa8a2732d247054852b6b85e1902'
         '7d831c4e18ffe6484d5817d250032b2d')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps $pkgname-$pkgver-py3-none-any.whl
  install -D -m644 $srcdir/spolyrics.desktop $pkgdir/usr/share/applications/spolyrics.desktop
}
