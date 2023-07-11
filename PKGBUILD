pkgname=mitogen
pkgver=0.3.4
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

sha1sums=('add063e91ddefa6a517904e5331e2f8eef6e52df')
sha256sums=('691172eb9f9a3951c2a1756844fcec931bf0e80ae0a6e84ccd58158b8bbfd365')
sha384sums=('7545849a5e7ef8d09201ce675a1e00059230a9ced83b4c219cc2c997088113268fc8b435c670e95c0dca93b280959e49')
sha512sums=('edbf2fdc93189ed8212dd840bbcb6fb64caf2a42716831e15f6b9c4dcb40359d54a9099e6c68d88caa72e2e5e2a60d4abaa18bd351fffe35f78527a1dd914454')
