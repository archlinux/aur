# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=edx-dl
pkgver=0.1.9
pkgrel=2
pkgdesc='A simple tool to download videos and lecture materials from Open edX-based sites'
arch=(any)
url='https://github.com/coursera-dl/edx-dl'
license=(LGPL3)
depends=(python-beautifulsoup4
         python-html5lib
         python-six
	 youtube-dl)
conflicts=(edx-downloader-git)
source=(https://github.com/coursera-dl/edx-dl/archive/$pkgver.tar.gz)
sha512sums=(1dc826f5b5d8eb72dd31a9aebc03f94d544f7ed19a3ede4d427770b5a25e4aace96ecdfee614ccb4bc75a69011c10e9baaf64b3f77f49c598ab827346f353289)

package() {
  cd $srcdir/edx-dl-$pkgver
  python setup.py install --root=$pkgdir --optimize=1
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/edx-dl/LICENSE
}
