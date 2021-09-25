# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="sqlfluff"
pkgver="0.6.6"
pkgrel=1
pkgdesc="A SQL linter and auto-formatter for Humans"
arch=("any")
url="https://github.com/sqlfluff/${pkgname}"
source=("https://github.com/sqlfluff/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("1aca9edb4891f5ae836b8f1f1da025569341744dc89323f881f3c9c5a83780cc")
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
