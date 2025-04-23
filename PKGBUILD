# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=python-himitsu
_name=py-himitsu
pkgver=0.0.6
pkgrel=1
pkgdesc='Himitsu client module for python'
url='https://git.sr.ht/~apreiml/py-himitsu'
license=(MIT)
arch=(x86_64 aarch64)
depends=(python)
makedepends=(python-build python-installer)
source=(
	https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz
)
sha256sums=(
	"636cddcbb9edd7f2228fa7da7263e58917dd6ef00e10f17f1207085543dbe0b2"
)

package() {
	cd "${_name//-/_}-$pkgver"
	python -m build -w
	python -m installer --destdir $pkgdir dist/${_name//-/_}-$pkgver-py3-none-any.whl
}
