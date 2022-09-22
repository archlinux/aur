# Maintainer: elParaguayo <elparaguayocode at gmail dot com>
pkgname=qtile-extras
pkgver=0.22.1
pkgrel=1
provides=("$pkgname")
conflicts=("$pkgname")
pkgdesc="Unofficial mods for qtile. Tagged release to match stable qtile releases."
url="https://github.com/elparaguayo/qtile-extras.git"
arch=("any")
license=("MIT")
depends=("python" "qtile")
makedepends=("git" "python-setuptools-scm")
optdepends=(
  "python-requests: various widgets"
  "python-iwlib: wifi icon widget"
  "python-dbus-next: various widgets"
)
source=(git+https://github.com/elparaguayo/qtile-extras#tag=v$pkgver?signed)
md5sums=("SKIP")
validpgpkeys=(
  'A6BAA1E17D2664ADB97B2C6F58A9AA7C86727DF7' # elParaguayo <elparaguayocode at gmail dot com>
)


package()
{
  cd "$pkgname"
  python setup.py install --root="$pkgdir"

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 CHANGELOG -t "$pkgdir/usr/share/doc/$pkgname/"
}
