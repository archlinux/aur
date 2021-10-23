# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="sqlfluff"
pkgver="0.7.1"
pkgrel=1
pkgdesc="A SQL linter and auto-formatter for Humans"
arch=("any")
url="https://github.com/sqlfluff/${pkgname}"
source=("https://github.com/sqlfluff/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("6470d7c57d62d6a9cc6b018bb6fa9bd5040c69f244e30872cbe4a7e1086e50f7")
license=("MIT")
depends=("python"
	 "python-click"
	 "python-colorama"
	 "python-cached-property"
	 "python-jinja"
	 "python-diff-cover"
	 "python-pathspec"
	 "python-pytest"
	 "python-tblib"
	 "python-appdirs"
 	 "python-bench-it"
	 "python-oyaml"
	 "python-configparser")
makedepends=('python-setuptools')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
