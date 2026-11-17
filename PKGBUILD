pkgname=mitogen
pkgver=0.3.55
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

sha1sums=('1d0cab978b8941356f1537d81a62bee0858b525a')
sha256sums=('4f5d943a47806b1440dbc321964d1895b47582b4aa5eda08dc7cfced8e098430')
sha384sums=('dfc4cd98542567c7a2cc4004e6005274922416eababb04eef913388a3cb0328f9a438c11f1969746fc198f8db4ddc543')
sha512sums=('7f61939f1dc66236c7579b172ff667972b56eefe86e0c2ed773a787449d49a4e86e7c0cd677d0f2712fd43a17596310e4f8fa5286e9fcef55a3f1aa719200e4f')
