# Maintainer: Giovanni Harting <anonfunc@archlinux.org>

pkgname=python-kconfiglib
_name=Kconfiglib
pkgver=14.1.0
pkgrel=6
pkgdesc='A flexible Python Kconfig implementation'
arch=(any)
url='https://github.com/ulfalizer/Kconfiglib'
license=(ISC)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel git)
source=("git+$url.git#tag=v$pkgver")
b2sums=('92902783dd3d8b3b2625ebae5ba10259b8eddaed8aa18fe9c2ebd14ceb92169cf31c0ada706418e2df37b05d21ba6e841a9f54de8ab2025bd2cd59a9c54a42f6')

build() {
	cd $_name
	python -m build --wheel --no-isolation
}

package() {
	cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
