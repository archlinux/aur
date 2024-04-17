pkgname=mitogen
pkgver=0.3.7
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

sha1sums=('36b9e19c3a0847a5b0acabfdbf371c45cc37cde7')
sha256sums=('d81054a4241b24818acd7fb22ed3b4387a08f21bc4798f1e77f7ba6b95741fff')
sha384sums=('f8ca1c7d7612fe824d5c155e2288523fcf1643ad7d4dd63d669389629d5e90d9196002f64bc9183fa4b6b2bce254bd4a')
sha512sums=('92f4fa863a7e53dfaaf131e588e2e85d9149578d4b44020c79511f793b41ac337c3bfdce4469827dd008a643907166ad79a3e8403c95fbec3b11b13d16427554')
