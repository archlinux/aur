# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=ipware
pkgname=python-ipware
pkgver=2.0.0
pkgrel=2
pkgdesc="Returns the best matched IP address from a given HTTP(s) header in Python"
arch=('any')
url="https://github.com/un33k/python-ipware"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools')
conflicts=('python-django-ipware')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/un33k/python-ipware/archive/v$pkgver.tar.gz")
sha256sums=('79c6a1759f6e814b3d1148eda2eb5f32206303d1d5a5e89a5f6b55f06735e303')

build() {
  cd "$pkgname-$pkgver" || exit
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
