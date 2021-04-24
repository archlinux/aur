# Maintainer: Tudor Roman <tudurom@gmail.com>

pkgname=pynotifyd
pkgver=0.0.2
pkgrel=2
pkgdesc="Simple freedesktop notification server"
arch=("any")
url="https://github.com/ricede/pynotifyd"
license=('ISC')
depends=("python-gobject" "python-dbus" "dbus-glib")
makedepends=("python" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=("65c08468c85e881dba948114f0fdb921")

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
