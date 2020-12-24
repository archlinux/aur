pkgname=mitogen
pkgver=0.3.0_rc.0
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD")
url="https://mitogen.networkgenomics.com/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("https://github.com/dw/mitogen/archive/v${pkgver//_/-}.tar.gz")
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

md5sums=('37c5e4de7cfdd557164b29af72e008e0')
sha1sums=('51d7d87ec02939ebf332352cef3cf94b97bee739')
sha256sums=('4683fe2ba57d2ad8ba5246ff6f963ec973a7bb636aa386d3b2d7d56b88e937e8')
sha384sums=('8c6893f40fb53dae132698f925768a3cba57a5e1ab1266f24e01c0971148ecd8c8c2943e8f7f3cfe67820ace6515965f')
sha512sums=('c12cf1be2bd91fbd7992d7b8592ee83a43bc7dc7cef44a54785a41f8fbdcfcb20273263efec1292aadd761d50b41bd07a2f7aa01f15c7dbd990174380163c8ff')
