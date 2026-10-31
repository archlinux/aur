# Maintainer: Dmitriy Geels <dmitriy dot geels at gmail dot com>
pkgname=python-whoosh-compat
pkgver=0.3.0
pkgrel=1
pkgdesc='Whoosh query-language parser emitting programmatic tantivy queries'
arch=(any)
url="https://github.com/stumpylog/whoosh-compat"
license=(MIT)
depends=(python 'python-dateutil>=2.8')
makedepends=(python-build python-installer python-wheel python-hatchling)
optdepends=('python-tantivy: Tantivy query emitter')
_ref=v0.3.0
_builddir=whoosh-compat-0.3.0
source=("whoosh-compat-v0.3.0.tar.gz::https://github.com/stumpylog/whoosh-compat/archive/refs/tags/$_ref.tar.gz")
sha256sums=('b6f7df8dc86eaf373d8bebbca607031f16e156e143975c7c5a12f7d093d729bf')

build(){
 cd "$srcdir/$_builddir"
 python -m build --wheel --no-isolation
}

package(){
 cd "$srcdir/$_builddir"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -Dm644 "$srcdir/whoosh-compat-0.3.0/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
