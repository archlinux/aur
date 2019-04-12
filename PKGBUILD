# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=checkdmarc
pkgver=0+289+1ccb575
_commit=1ccb575187ebbded606b322a2d048ff3264f720a
pkgrel=1
pkgdesc='Parser for SPF and DMARC DNS records'
arch=(any)
url=https://domainaware.github.io/checkdmarc
license=(Apache)
depends=(python-dnspython
         python-pyleri
         python-publicsuffix
         python-wheel
         python-nose
         python-timeout-decorator
         python-publicsuffix2
         python-expiringdict)
makedepends=(git python-setuptools)
source=(git+https://github.com/domainaware/checkdmarc#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd checkdmarc
  printf 0+%s+%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  cd checkdmarc
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/checkdmarc
}
