# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-sv-ttk
_name=sv_ttk
pkgver=2.5.2
pkgrel=1
pkgdesc="A gorgeous theme for ttk, based on Microsoft's Sun Valley visual styles"
arch=('any')
url="https://github.com/rdbende/Sun-Valley-ttk-theme"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8d5756ba53238016c83cce3b915f7a6a394b63ca39aca228122ddb4a24928d6e')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
