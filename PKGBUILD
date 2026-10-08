# Maintainer: Mikkel Kappel Persson <mikkel@kappelpersson.dk>
pkgname=huebox
_name=huebox
pkgver=0.4.1
pkgrel=1
pkgdesc="A terminal theme editor with live preview"
arch=(any)
url="https://github.com/MikkelKappelPersson/huebox"
license=(MIT)
depends=(python-pygments python-textual)
makedepends=(python-build python-installer python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('650602de9618746d3ea1679feec7adeb96b8a29e00aed2859f4f846b5e2705fc')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
