# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-scrap_engine
pkgver=1.5.4
pkgrel=1
pkgdesc="A 2D ascii game engine for the terminal"
arch=('any')
url="https://pypi.org/project/scrap-engine"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-setuptools-scm')
source=("$pkgname::git+https://github.com/lxgr-linux/scrap_engine.git#tag=$pkgver")
sha256sums=('1444a819e7f820e92a9ec3730798362eb670ca1aaad269feb4a0bf2ab7b4b00a')
b2sums=('bcefc2d2d1490fbb9a4c3ddf584daf109a5bccb99795207674070d02133cd067e4e53b8a9ed5ffc52c19c109c91e2ca9c3ae2a2e166558bb4b3a4b962308c0f3')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
