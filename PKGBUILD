# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=checkdmarc
pkgver=0+186+fb7de98
_commit=fb7de9807df152a1a592de04f27db000779135e4
pkgrel=1
pkgdesc='Parser for SPF and DMARC DNS records'
arch=(any)
url=https://domainaware.github.io/checkdmarc
license=(Apache)
depends=(python-dnspython
         python-pyleri
         python-publicsuffix
         python-wheel
         python-nose)
makedepends=(git python-setuptools)
source=(git+https://github.com/domainaware/checkdmarc#commit=$_commit)
sha512sums=(SKIP)

pkgver() {
  cd checkdmarc
  printf 0+%s+%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  cd checkdmarc
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 -t "$pkgdir"/usr/share/licenses/checkdmarc LICENSE
}
