# Maintainer: Mikkel Kappel Persson <mikkel@kappelpersson.dk>
pkgname=huebox
_name=huebox
pkgver=0.3.2
pkgrel=1
pkgdesc="A terminal theme editor with live preview"
arch=(any)
url="https://github.com/MikkelKappelPersson/huebox"
license=(MIT)
depends=(python-pygments python-textual)
makedepends=(python-build python-installer python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0560bf0b67c314e82774bc134cb3c42a008c129ec56d80a24cda39d58492c05e')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
