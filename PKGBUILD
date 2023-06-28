# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-sv-ttk
_name=sv_ttk
pkgver=2.5.1
pkgrel=1
pkgdesc="A gorgeous theme for ttk, based on Microsoft's Sun Valley visual styles"
arch=('any')
url="https://github.com/rdbende/Sun-Valley-ttk-theme"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e32d60587db7debe4d7d7438f66257ffcd9db5b8efbcb52151697fa8a662a4f5')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
