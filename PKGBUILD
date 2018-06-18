# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=gmailieer
pkgver=0.9
pkgrel=1
pkgdesc='Fast fetch and two-way tag synchronization between notmuch and GMail'
arch=('any')
url=https://github.com/gauteh/gmailieer
license=('GPL3')
depends=('python-oauth2client' 'python-google-api-python-client' 'python-tqdm')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('516cf16c896b225b613bf4cb4304ef56194128e5469387bf64b6bc1f13d9462124da4ec45c530b3c998fe167c8523becf27852816e4a9edbb258181288c229c0')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
