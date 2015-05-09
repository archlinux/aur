# Maintainer: Yaron de Leeuw < me@jarondl.net  >

# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl
pkgname=python-pies
_pkgname=pies
pkgver=2.6.5
pkgrel=1
pkgdesc="The simplest (and tastiest) way to write one program that runs on both Python 2.6+ and Python 3."
arch=('any')
url="https://github.com/timothycrosley/pies"
license=('MIT')
depends=('python')
makedepends=(python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('c16f72114fe14c8c93774364b739f74b3d84c38189fd9c0590ef807efc1ed4a366dc26da2837b7c804b4f04ff25ad3a148420a7d0d0f084ba656ae56330bb0fb')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

