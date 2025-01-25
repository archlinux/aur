# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-scrap_engine
pkgver=1.4.2
pkgrel=1
pkgdesc="A 2D ascii game engine for the terminal"
arch=('any')
url="https://pypi.org/project/scrap-engine"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
source=("$pkgname::git+https://github.com/lxgr-linux/scrap_engine.git#tag=$pkgver")
sha256sums=('13279bd3cfc294e92201d48a1508222efcbd87d6065c894f497ab7297e5357bf')
b2sums=('3ae71b3ca2f7bed21ea7d7dafe75eb8b3823722aebb052fd522d1c771a2452deda1827f89f4a9740340b76244cd25cd04ea817c187062c13317e621f2c0fc2dd')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
