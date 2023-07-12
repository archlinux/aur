# Maintainer: getzze <getzze [at] @gmail [dot] com>
# Maintainer: Maziar Saleh Ziabari <helasraizam@gmail.com>
# Contributor: Philipp A. <flying-sheep@web.de>

pkgname=jupyter_contrib_core
pkgver=0.4.2
pkgrel=1
pkgdesc='Common utilities for jupyter-contrib projects'
arch=(any)
url="https://github.com/jupyter-contrib/$pkgname"
license=(BSD)
depends=(python jupyter-notebook python-tornado)
makedepends=(python-pip)
_file="$pkgname-$pkgver.tar.gz"
source=("https://pypi.io/packages/source/${pkgname::1}/$pkgname/${_file}")
sha256sums=('1887212f3ca9d4487d624c0705c20dfdf03d5a0b9ea2557d3aaeeb4c38bdcabb')

package() {
    pip install \
	--compile --no-deps \
	--ignore-installed --no-warn-script-location \
	--root="${pkgdir}" "${_file}"

    # clean pycache
    find ${pkgdir} -regex '^.*\(__pycache__\|\.py[co]\)$' -delete
}
