# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=python-pyinspirehep
pkgver=1.1.1
pkgrel=1
pkgdesc="Python wrapper for the INSPIRE-HEP API"
arch=('any')
url="https://github.com/javadebadi/pyinspirehep"
license=('MIT')
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pyinspirehep/pyinspirehep-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/javadebadi/pyinspirehep/7e20b0f274bd6a44425588896b50cc64f71a7248/LICENSE")
sha256sums=('9d6e9db0d08f24626037322a648e4859da56159541623a35c15231564f0a2be0'
            '931f4fc11a021e7196894430d54cc521d1787615c20d793678f92c53c011bc62')

build() {
  cd "pyinspirehep-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pyinspirehep-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
