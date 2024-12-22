# Maintainer: Andrea Pascal <andrea@anodium.net>

pkgname=soundscrape-git
pkgver=r237.efc63b9
pkgrel=1
pkgdesc="SoundCloud (and Bandcamp and Mixcloud) downloader in Python"
arch=(any)
url="https://github.com/Miserlou/SoundScrape"
license=(Apache-2.0)
depends=(
    python
    python-clint
    python-demjson
    python-requests
    python-soundcloud
    python-mutagen
)
makedepends=(git python-setuptools)
checkdepends=(python-nose)
provides=(soundscrape)
conflicts=(soundscrape)
source=('git+https://github.com/Miserlou/SoundScrape.git')
sha512sums=('SKIP')

build() {
  cd $srcdir/SoundScrape
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/SoundScrape
  python setup.py build
}

package() {
  cd $srcdir/SoundScrape
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}