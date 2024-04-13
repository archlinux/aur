# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=ipware
pkgname=python-ipware
pkgver=2.0.3
pkgrel=1
pkgdesc="Returns the best matched IP address from a given HTTP(s) header in Python"
arch=('any')
url="https://github.com/un33k/python-ipware"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools')
conflicts=('python-django-ipware')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/un33k/python-ipware/archive/v$pkgver.tar.gz")
sha256sums=('499b141f4de01d27b548e57a604a99408122fc5ecd1e96aa53a2ee20035ccc8d')

build() {
  cd "$pkgname-$pkgver" || exit
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
