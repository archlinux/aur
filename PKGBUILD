# Maintainer: Joshua Smith <smolsheep@opensuse.org>

pkgname=rpm-spec-language-server
pkgver=0.0.1
pkgrel=1
pkgdesc='Language Server for RPM spec files'
url='https://github.com/dcermak/rpm-spec-language-server'
arch=('any')
license=('GPL-2.0-or-later')
makedepends=(
	python-build
	python-wheel
	python-installer
)
depends=(
	python-specfile
	python-pygls
)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
b2sums=(
	'19cfff078b60ad1886e97396b668dfae5a983c024013d63a415734d76174f7aedc312a51775b0af0d96a45e0d80ca6752e6bacbcf382c53c8f94c758d718e453'
)

build(){
	cd $_archive
	python -m build --wheel --no-isolation
}
package(){
	cd $_archive
	python -m installer --destdir="$pkgdir" dist/*.whl
}
