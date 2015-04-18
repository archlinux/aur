# Maintainer: Yaron de Leeuw < me@jarondl.net  >

# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl
pkgname=python-isort
_pkgname=isort
pkgver=3.9.6
pkgrel=1
pkgdesc="isort your python imports for you so you don't have to."
arch=('any')
url="https://github.com/timothycrosley/isort"
license=('MIT')
depends=(python python-pies python-natsort)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha512sums=('70a186b5a4b837b524dc60080631cdf159ccc17616a4224644069cc364c9484a9db7941e9ab60681fa8f4066ea38c83c66cdcc17eac0329efd1d30ee011576a8')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
