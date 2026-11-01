# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="fava-dashboards"
_name="fava-dashboards"
pkgver=2.0.2
pkgrel=1
pkgdesc="Custom Dashboards for Beancount in Fava"
arch=("any")
url="https://github.com/andreasgerstmayr/fava-dashboards"
license=("MIT")
depends=("beanquery" "fava" "python" "python-flask" "python-yaml")
makedepends=("python-build" "python-installer" "python-hatchling" "python-hatch-vcs" "python-wheel")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('01aa4ed537280017605edf2a7c094f36ceabc2cdcf794ba8a7e110a3cd5d4aa6')

build(){
 cd "${_name//-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_name//-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/$pkgname"
}
