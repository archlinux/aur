# Maintainer: Yaron de Leeuw < me@jarondl.net  >

# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl
pkgname=python-pies
_pkgname=pies
pkgver=2.6.3
pkgrel=2
pkgdesc="The simplest (and tastiest) way to write one program that runs on both Python 2.6+ and Python 3."
arch=('any')
url="https://github.com/timothycrosley/pies"
license=('MIT')
depends=('python')
makedepends=(python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('7a6bb0bdcc0ddb13c2d7cd6929ffeada3d7f08d12527a098aa590b1e76e530719c68e6e5f99ed07c3f2f4aa52d5b730f54638c0aab04bb3cc606f8077ed0f74b')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

