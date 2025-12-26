# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Submitter: not_anonymous <nmlibertarian@gmail.com>

pkgname=python-adif-io
_pkgname=adif_io
pkgver=0.6.0
pkgrel=1
pkgdesc="Python - Input/Output of ADIF Ham Radio Logs."
arch=(any)
url="https://pypi.org/project/adif-io/"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-wheel)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/39/70/\
1f653b7d5f0d0252a443461227e84862d27d5fd4e0919f1d0260cde0e299/adif_io-0.6.0.tar.gz")

build() {
	cd $srcdir/$_pkgname-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/$_pkgname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.txt"
}
md5sums=('9cfff1d0d8bf114ebfb06ea84cf785dc')
sha256sums=('d58dd7f45d9c1c83a1b3bc5e7a1bbe01a0e442647d46ece2367647255f4b5833')
