# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>

pkgname=python-webruntime
pkgver=0.5.8
pkgrel=3
pkgdesc='Launch HTML5 apps in the browser or a desktop-like runtime.'
arch=('any')
url='https://github.com/flexxui/webruntime'
license=('BSD')
depends=('python-dialite')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('08e4ea844e544b28433c35bd485cecaa672d60b5206877f7b4bb49d537fd248c')

build() {
  cd "webruntime-$pkgver"
  python setup.py build
}

package() {
  cd "webruntime-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:
