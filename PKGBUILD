# Maintainer: Yaron de Leeuw < me@jarondl.net  >

# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl
pkgname=python-isort
_pkgname=isort
pkgver=4.2.5
pkgrel=1
pkgdesc="isort your python imports for you so you don't have to."
arch=('any')
url="https://github.com/timothycrosley/isort"
license=('MIT')
depends=(python)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha512sums=('75e845f9124c47380ad3c5ad9239c5061c689c10f75eab8394efe31a50f563b7f56ff82d1da1e2c6a6e66cb4f9fbb2d165897ddbad59ace8e3ac13ded85f1669')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
