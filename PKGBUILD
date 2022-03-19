# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

pkgname=python-acme
pkgver=1.25.0
pkgrel=1
pkgdesc="ACME protocol implementation in Python"
arch=('any')
license=('Apache')
url="https://github.com/certbot/certbot"
depends=(
  'python-cryptography'
  'python-josepy'
  'python-pyopenssl'
  'python-pyrfc3339'
  'python-pytz'
  'python-requests'
  'python-requests-toolbelt'
  'python-setuptools'
)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/a/acme/acme-$pkgver.tar.gz")
sha512sums=('a7508fb9a71578509925fa5d0ce9994910e9dfbd92c07f25409bc6463bb23693a925a8cb946330c3c187da85dc083c0775193baa1c5ff1327ed8e1541507d877')
b2sums=('4c7245b41f303d781974e047be916c152ef794796e22075ccaef5622fabce091fc7821f706978b38d315b57a2361dac477009a5e4c54e6bc8a034de681f5266a')

build() {
  cd "acme-$pkgver"
  python setup.py build
}

check() {
  cd "acme-$pkgver"
  python -m pytest
}

package() {
  cd "acme-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
