pkgname=python-django-treenode
pkgver=0.25.0
pkgrel=1
pkgdesc='probably the best abstract model/admin for your tree based stuff.'
arch=(any)
url="https://github.com/fabiocaccamo/django-treenode"
license=(MIT)
depends=(python python-django)
makedepends=(python-build python-installer python-wheel python-setuptools)
_ref=0.25.0
_builddir=django-treenode-0.25.0
source=("django-treenode-0.25.0.tar.gz::https://github.com/fabiocaccamo/django-treenode/archive/refs/tags/$_ref.tar.gz")
sha256sums=('ba3e0d3c25c296a09d5e5d63d6d66154cea676b8fb27ccf436b7011deadaef0b')

build(){
 cd "$srcdir/$_builddir"
 python -m build --wheel --no-isolation
}

package(){
 cd "$srcdir/$_builddir"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -Dm644 "$srcdir/django-treenode-0.25.0/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
