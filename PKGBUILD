# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=edx-dl
pkgver=0.1.10
pkgrel=2
pkgdesc='Tool to download videos and lecture materials from Open edX-based sites'
arch=(any)
url=https://github.com/coursera-dl/edx-dl
license=(LGPL3)
depends=(python-beautifulsoup4
         python-html5lib
         python-six
         youtube-dl
         python-requests)
conflicts=(edx-downloader-git)
source=(edx-dl-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha512sums=('3de368688c8cd7f283dbdb675c5ad75e654d67d26f9a8b6e0724007ff5551fbdbbffd4059af371c1b9b09d1d22d0525466d3fdfb6f16bd7778b9f940a06f7e6d')

package() {
  cd edx-dl-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/edx-dl/LICENSE
}
