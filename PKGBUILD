# Maintainer: Håvard Pettersson <mail@haavard.me>

_name=yahoofinancials
pkgbase=python-$_name
pkgname=(python-$_name python2-$_name)
pkgver=0.5
pkgrel=1
pkgdesc='Pull fundamental and technical stock data from Yahoo Finance by web scraping'
url='https://github.com/JECSand/yahoofinancials'
arch=(any)
license=(MIT)
depends=(python python-requests python-beautifulsoup4 python-pytz)
makedepends=(python-setuptools python2-setuptools)
source=("https://github.com/JECSand/$_name/archive/$pkgver.tar.gz")
sha256sums=('1e3e40be495be11935121b9e756bc6b8768a90849888ff428ab3e98aae77d9e8')

prepare() {
  cp -a $_name-$pkgver $_name-$pkgver-py2
}

package_python-yahoofinancials() {
  cd $_name-$pkgver
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname[0]}/LICENSE"
}

package_python2-yahoofinancials() {
  depends=(python2 python2-requests python2-beautifulsoup4 python2-pytz)

  cd $_name-$pkgver-py2
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname[1]}/LICENSE"
}

# vim:set ts=2 sw=2 et:
