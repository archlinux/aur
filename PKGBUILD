# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname='python-aenum'
_pkgname='aenum'
pkgver=2.2.3
pkgrel=1
pkgdesc="Advanced Enumerations (compatible with Python's stdlib Enum), NamedTuples, and NamedConstants"
arch=('any')
url="https://bitbucket.org/stoneleaf/aenum"
license=('BSD')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/6f/6a/8ed729e0add885d7a559ebb06133029b1f8c4bd66cbf1bdee1ec969fb310/aenum-2.2.3.tar.gz")
sha256sums=('a4334cabf47c167d44ab5a6198837b80deec5d5bad1b5cf70c966c3a330260e8')

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

