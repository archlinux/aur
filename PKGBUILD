pkgname=mitogen
pkgver=0.3.39
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD-3-Clause")
url="https://mitogen.networkgenomics.com/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mitogen-hq/mitogen/archive/v${pkgver//_/-}.tar.gz")
arch=('any')

build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha1sums=('80a335897d207ee1c5a753ec54aa78a529a9085f')
sha256sums=('5cab39af198f0859a250f6cde36fe652963bf371bac4d298ff257f4bfc23f6aa')
sha384sums=('69388b4111dc38a22ee96c1a94db1420d5f56d3809c2f6c25b2738b66f0374faff6f60cab797021a48db759420da6676')
sha512sums=('3fb8f3a0b448d830022bab38a21d33aab4020ef1b2ac8b03bcc46e7c70f72b5becccec7cac6389b01eb6390ca366ff0b5fc7f1974fb87cf0f6ecee63d08a16ab')
