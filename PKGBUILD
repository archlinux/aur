# Maintainer : David Beley <dbeley@protonmail.com>
pkgname=ypc-git
pkgver=0.0.1
pkgrel=1
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="Convert spotify/deezer/text playlists to youtube urls or audio/video files"
arch=('any')
url="https://github.com/dbeley/${pkgname%-git}"
license=('MIT')
depends=(
        'python'
        'python-setuptools'
        'youtube-dl'
        'python-requests'
        'python-spotipy-git'
        'python-pandas'
        'python-beautifulsoup4'
        'python-lxml'
        )
source=("git+https://github.com/dbeley/${pkgname%-git}")
md5sums=("SKIP")

package() {
  cd "${pkgname%-git}"
  #python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
