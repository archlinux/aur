# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="sqlfluff"
pkgver="0.8.1"
pkgrel=1
pkgdesc="A SQL linter and auto-formatter for Humans"
arch=("any")
url="https://github.com/sqlfluff/${pkgname}"
source=("https://github.com/sqlfluff/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("f30016a5928e4b273abbd6d16df05cf7c3176280e75bb0e04c0b3cdcdd91e543")
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
	 "python-configparser"
     "python-toml"
     "python-tqdm")
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
