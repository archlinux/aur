# Maintainer: Jonas Jelten <jj@stusta.net>

pkgname="kevin"
pkgver=0.4
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
sha256sums=('ed68a0a220a9b8c45a0edff09477b99464f6eba1b99547b9ea4944c99c3ac489')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
