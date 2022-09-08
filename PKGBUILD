# Maintainer: loathingkernel <username at gmail dot com>

pkgname=python-wordninja
_pyname=${pkgname#python-}
pkgver=2.0.0
pkgrel=2
pkgdesc='Probabilistically split concatenated words using NLP based on English Wikipedia unigram frequencies'
arch=(x86_64)
url="https://github.com/keredson/$_pyname"
license=(MIT)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('1a1cc7ec146ad19d6f71941ee82aef3d31221700f0d8bf844136cf8df79d281a')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
