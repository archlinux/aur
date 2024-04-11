# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=ipware
pkgname=python-ipware
pkgver=2.0.2
pkgrel=1
pkgdesc="Returns the best matched IP address from a given HTTP(s) header in Python"
arch=('any')
url="https://github.com/un33k/python-ipware"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools')
conflicts=('python-django-ipware')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/un33k/python-ipware/archive/v$pkgver.tar.gz")
sha256sums=('bfdbf1a32f5852d4a1045969fc87f6f47e01d8b5618c7624951a95f67118b961')

build() {
  cd "$pkgname-$pkgver" || exit
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
