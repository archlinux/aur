# Maintainer: Jonas Jelten <jj@stusta.net>

pkgname="kevin"
pkgver=0.2
pkgrel=1
pkgdesc="Kevin-CI: a simple-stupid self-hosted continuous integration service"
arch=('any')
url="https://github.com/SFTtech/kevin"
license=('AGPL3')
groups=()
depends=('python' 'python-requests' 'python-tornado')
makedepends=()
provides=()
conflicts=('kevin-git')
replaces=()
backup=()
options=(!emptydirs)
install=
source=("$pkgname-$pkgver.tar.gz::https://github.com/SFTtech/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('01e84ee9a5f3f9ee8d2b0c74b1fb2b31047d25037079b7ee85bf8b3fbada81e3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
