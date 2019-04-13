# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=parsedmarc
pkgver=0+584+536b94f
_commit=536b94ff9056c20cec846e41b7ca7853b7cc678f
pkgrel=1
pkgdesc='Python package and CLI for parsing aggregate and forensic DMARC reports'
arch=(any)
url=https://domainaware.github.io/parsedmarc
license=(Apache)
depends=(python-dnspython
         python-requests
         python-publicsuffix
         'python-xmltodict>=0.12.0'
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
         rstcheck
         'python-tqdm>=4.31.1'
         'python-kafka>=1.4.4'
         'python-elasticsearch-dsl<7.0.0'
         'python-elasticsearch<7.0.0')
makedepends=(git python-setuptools)
source=(git+https://github.com/domainaware/parsedmarc#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd parsedmarc
  printf 0+%s+%s $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
  cd parsedmarc
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/parsedmarc
}
