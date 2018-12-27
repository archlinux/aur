# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: renek <aur@spaceshore.net>

pkgname=python-aiosasl
pkgver=0.4.0
pkgrel=1
pkgdesc="A pure python generic asyncio SASL library"
arch=('any')
url="https://github.com/horazont/aiosasl"
license=('LGPL3')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://github.com/horazont/aiosasl/archive/v${pkgver}.tar.gz")
sha256sums=('6cf620672b64669b9136ab73e42f022d95a328385bff5053080356fdbb129f82')

check() {
  cd "aiosasl-$pkgver"
  python -m nose
}

package() {
  cd "aiosasl-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim: ts=2 sw=2 et:
