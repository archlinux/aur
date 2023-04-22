# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-sv-ttk
_name=sv_ttk
pkgver=2.4.5
pkgrel=1
pkgdesc="A gorgeous theme for ttk, based on Microsoft's Sun Valley visual styles"
arch=('any')
url="https://github.com/rdbende/Sun-Valley-ttk-theme"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('cac461471ae697ec2696e1fc179004eef6585eb4cd520e59cc8fb6ea3c293a97')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
