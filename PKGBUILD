# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="sqlfluff"
pkgver="0.6.2"
pkgrel=1
pkgdesc="A SQL linter and auto-formatter for Humans"
arch=("any")
url="https://github.com/sqlfluff/${pkgname}"
source=("https://github.com/sqlfluff/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("e22a4ddb11ff47013c9d96182b25965f279194dcbd57cdac7fa222f96d8dd64f")
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
