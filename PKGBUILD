pkgname=mitogen
pkgver=0.3.0
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD")
url="https://mitogen.networkgenomics.com/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("https://github.com/mitogen-hq/mitogen/archive/v${pkgver//_/-}.tar.gz")
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

md5sums=('ba64e120bb66f7cd2ee33ce6ee381d8d')
sha1sums=('17d1d6dda926954dde1ddd342844d2ae62592173')
sha256sums=('02160f881fd918cc3f04d900d9eb3c1b886793d8720cdcdecb664f809960005d')
sha384sums=('c0501e3dc96dce917fa0416877bb11bfdb940e818b234f964affb1ef5f4e410137bf431f6a2d1b6cf2ad55ec1922262e')
sha512sums=('e0e0a38724220f18607254abc4946e7207f47f610e9a8d4bf7059d6e196ca978fb795133c2eef35a3031dcc90300fb8faa2532020c2bf4c75e09f00f37a9d9bd')
