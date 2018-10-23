pkgname=mitogen
pkgver=0.2.3
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD")
url="https://mitogen.readthedocs.io/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("https://github.com/dw/mitogen/archive/v${pkgver}.tar.gz")
arch=('any')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('c8c3e93d7955e93deac06cbdadd2b313')
sha1sums=('eb916f124515fda3e64d79d0647ef0214e229ebd')
sha256sums=('63dddc33b4c669a1543c61e4af560adebbc5afc3e693772cd8241cc93a885de2')
sha384sums=('df912003716afeec25ac00e698d27e5393fc9dda819dde40e030963e275341f2fc65d2cb222110cdee991ffff7f60b5e')
sha512sums=('e0edcf1006030ce534d234d13dbd6219d5dd2c822ab40c1c53a536090c7200cf312a4a4e3a558a5d0ccf613f6a4500d12a796528de443cfcf4e0006d0759be3f')
