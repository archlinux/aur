#Maintainer: Liam Timms <timms5000@gmail.com>

_pkgname=etelemetry
pkgname=python-$_pkgname
_name=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc="Etelemetry python client API"
url="https://github.com/sensein/etelemetry-client"
arch=('any')
license=('apache')
depends=('python-ci-info')
provides=("python-etelemetry")
options=(!emptydirs)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/sensein/etelemetry-client/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5f710fdb17ec02f93be29d234b33c1c62ad641320d1b4047e61044679018de03')

build() {
  cd "$srcdir/$_pkgname-client-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-client-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

