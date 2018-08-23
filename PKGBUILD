# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=parsedmarc
pkgver=0+159+4853537
_commit=485353776573fd0a5860b53aa5d97fdbcf7a4456
pkgrel=1
pkgdesc='Python package and CLI for parsing aggregate and forensic DMARC reports'
arch=(any)
url=https://domainaware.github.io/parsedmarc
license=(Apache)
depends=(python-dnspython
         python-requests
         python-publicsuffix
         python-xmltodict
         python-pygeoip
         python-dnspython
         python-imapclient
         python-mail-parser
         python-dateparser
         python-elasticsearch
         python-elasticsearch-dsl
         flake8
         python-sphinx
         python-sphinx_rtd_theme
         python-collective-checkdocs
         python-wheel
         rstcheck)
makedepends=(git python-setuptools)
source=(git+https://github.com/domainaware/parsedmarc#commit=$_commit)
sha512sums=(SKIP)

pkgver() {
  cd parsedmarc
  printf 0+%s+%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  cd parsedmarc
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 -t "$pkgdir"/usr/share/licenses/parsedmarc LICENSE
}
