# Maintainer : David Beley <dbeley@protonmail.com>
pkgname=ypc-git
pkgver=1.6.0
pkgrel=1
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="Convert spotify/deezer/text albums/playlists to youtube urls and/or download audio/video files."
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
        'python-tqdm'
        'python-itunespy'
        )
source=("git+https://github.com/dbeley/${pkgname%-git}")
md5sums=("SKIP")

build() {
  cd "${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
