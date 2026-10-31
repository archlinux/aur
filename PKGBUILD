# Maintainer: Dmitriy Geels <dmitriy dot geels at gmail dot com>

pkgname=python-django-cachalot
pkgver=2.9.1
pkgrel=1
pkgdesc='Caches your Django ORM queries and automatically invalidates them.'
arch=(any)
url="https://github.com/noripyt/django-cachalot"
license=(BSD-3-Clause)
depends=(python 'python-django<6.2' 'python-django>=4.2')
makedepends=(python-build python-installer python-wheel python-setuptools)
_ref=v2.9.1
_builddir=django-cachalot-2.9.1
source=("django-cachalot-v2.9.1.tar.gz::https://github.com/noripyt/django-cachalot/archive/refs/tags/$_ref.tar.gz")
sha256sums=('a6786e5d8a14e2a070151f45b6911fe4f4ae4e2f174c00d9d831f72ccb5958be')

build(){
 cd "$srcdir/$_builddir"
 python -m build --wheel --no-isolation
}

package(){
 cd "$srcdir/$_builddir"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -Dm644 "$srcdir/django-cachalot-2.9.1/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
