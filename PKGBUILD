# Maintainer: Peter Mattern <pmattern at arcor dot de>

pkgname=python-libravatar-py
pkgver=1.0.1
_commit=b3f871c585773b002065b02dfd0c63c3356ff11d
pkgrel=1
pkgdesc="A libravatar client for Python that's built on modern technology"
arch=('any')
url="https://github.com/baseplate-admin/libravatar-py"
license=('MIT')
depends=('python-httpx' 'python-dnspython')
makedepends=('git' 'python-build' 'python-poetry-core' 'python-installer')
#checkdepends=()
source=("git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')
#validpgpkeys=()

build() {
	cd "${pkgname#python-}"
	python -m build --no-isolation --skip-dependency-check --wheel
}

#check() {
#}

package() {
	cd "${pkgname#python-}"
	python -m installer --destdir "${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
