pkgname=mitogen
pkgver=0.3.11
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

sha1sums=('aebc00a6e0f7542b3f5944c197d136a4a3b6c6b8')
sha256sums=('8d5555401bcbff7bc68c05724465a4aa04444deb0727aefe400fbbba3bc1afb2')
sha384sums=('fb4083e56331fc91d4b6d8e23d80121c5a6ab12ecc36eddc5b55af5b250edd8f729e88ae9528cb1a5bbe6ca743c63b32')
sha512sums=('14f68fef51c46f1458bae37b4174b051f6ed9f1964757977f179e5a6f4dc19925eaad99c87e67a56b165e88a4bb0641bd894c53173f1f0a652034bf4b5950a72')
