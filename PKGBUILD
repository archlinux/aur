pkgname=mitogen
pkgver=0.3.43
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

sha1sums=('a9b151e7cfd02ccec03210395791fd4a1eb0d56f')
sha256sums=('4879ff50cb72c7737afda0c0ff413ca9386a52b35b71e5bbf9f9957f38769210')
sha384sums=('8b385a98ea57bac07ce90e57eaa4b3c7fe54e5431f1aea5eb7ad96459ef6f8698354b64ec38ba6a72510fc142a694f23')
sha512sums=('0aaaace4b47e6b382acefbc7039dcda1d74c01cee2781c2e9bb49f236751590f55085cb9bf42453a08d8ba688593c969279aaefbe4d52cf58cb3a87ae589b701')
