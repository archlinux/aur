# Maintainer: Tpaefawzen <GitHub: Tpaefawzen>
# Contributer: Hugo Osvaldo Barrera <hugo@whynothugo.nl>

pkgname=lsplug
pkgver=5
pkgrel=1
pkgdesc="Nicer version of lsusb"
arch=('any')
url="https://git.sr.ht/~martijnbraam/lsplug"
license=('custom:MIT')
depends=('python' 'hwdata')
makedepends=(python-build python-installer python-wheel python-setuptools)
# source=("https://git.sr.ht/~martijnbraam/lsplug/archive/${pkgver}.tar.gz")
source=("https://git.sr.ht/~martijnbraam/lsplug/archive/3ce22848fcd426bd27cc3a8d0a1592e465b826a5.tar.gz")
sha512sums=('b91190cb234e158322e2bb24a9771a3682b52d5c0441fe46b7e7328f7c5e2d90295335cb67b54c75aeca300df836a1a111d9bcaf4a3d2666ae065f9a93a3b6d2')

# _dir="${pkgname}-${pkgver}"
_dir=lsplug-3ce22848fcd426bd27cc3a8d0a1592e465b826a5

build() {
cd "$srcdir/$_dir"

  python -m build --wheel --no-isolation
}

package() {
cd "$srcdir/$_dir"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # License file
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
