pkgname=mitogen
pkgver=0.3.49
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

sha1sums=('ca53046947d216c6d8055eda2710043108842f41')
sha256sums=('7cfe269c37a95f24c0c9c6c968ae3cbea4057fbf80f502dca31e1adeb700cf43')
sha384sums=('3c22607344cd652c616ef50d4e784aff14d7e2a434b90f2daa933030bbd8bee9d2aed425da6b7390e1c79aad8383e06d')
sha512sums=('8dc5099a39322a7477fcea4e031aa789e962e8da6a0ba71454da7d0850ab755f06dc181f9299976eee658bb86f22c9aaa76fc2c459a024cfe8c6fff2f3338bdd')
