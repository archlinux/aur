# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-sv-ttk
_name=sv_ttk
pkgver=2.4.2
pkgrel=1
pkgdesc="A gorgeous theme for ttk, based on Microsoft's Sun Valley visual styles"
arch=('any')
url="https://github.com/rdbende/Sun-Valley-ttk-theme"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('eb045951e0d35c868a361946f71e222747c01462406a02e3deed18d4a2b463c8')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
