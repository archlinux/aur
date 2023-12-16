# Maintainer: Jax Young <jaxvanyang@gmail.com>

pkgname=dotbackup
pkgver=0.0.2
pkgrel=1
pkgdesc='YAML config based backup utility'
arch=('any')
url='https://github.com/jaxvanyang/dotbackup'
license=('MIT')
depends=('python-ruamel-yaml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://github.com/jaxvanyang/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e3e4b3541299fc64afe2440f826623914e7143992428125450ac61075c137a71')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
