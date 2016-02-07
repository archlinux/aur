# Maintainer: Yaron de Leeuw < me@jarondl.net  >

# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl
pkgname=python-isort
_pkgname=isort
pkgver=4.2.2
pkgrel=1
pkgdesc="isort your python imports for you so you don't have to."
arch=('any')
url="https://github.com/timothycrosley/isort"
license=('MIT')
depends=(python)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha512sums=('c5035cf5c594c75765a6fa82c80035e38c1878e022428a031502778e69d1fb509b1e98fbd79fcf0266c9758f1df41563480190f03efc2370908dacb8924767ee')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
