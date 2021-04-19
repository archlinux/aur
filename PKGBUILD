# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname='python-aenum'
_pkgname='aenum'
pkgver=3.0.0
pkgrel=1
pkgdesc="Advanced Enumerations, NamedTuples, and NamedConstants for Python"
arch=('any')
url="https://bitbucket.org/stoneleaf/aenum"
license=('BSD')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/11/82/7f1df9994e1d46533bd9e77484c440347b7dba349ca2ce6eb4f06ddd38ae/aenum-3.0.0.tar.gz")
sha256sums=('17cd8cfed1ee4b617198c9fabbabd70ebd8f01e54ac29cd6c3a92df14bd86656')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  depends=("python")
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 aenum/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

