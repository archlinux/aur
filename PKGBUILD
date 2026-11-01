# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="fava-portfolio-returns"
_name="fava-portfolio-returns"
pkgver=2.7.0
pkgrel=1
pkgdesc="Show portfolio returns in Fava"
arch=("any")
url="https://github.com/andreasgerstmayr/fava-portfolio-returns"
license=("GPL-2.0")
depends=("beancount" "fava" "python" "python-dateutil" "python-numpy" "python-pandas" "python-protobuf" "python-scipy")
makedepends=("python-build" "python-installer" "python-hatchling" "python-hatch-vcs" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('a3719fc2121011a8943964e77cd5fd2dedd1122bbec3e38b3b00f2020fae66c6')

build(){
 cd "${_name//-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_name//-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "COPYING" -t "$pkgdir/usr/share/licenses/$pkgname"
}
