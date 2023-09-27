# Maintainer: Enzo Einhorn <enzo.einh@gmail.com>

pkgname=gnome-extensions-cli
_pkgname=gnome_extensions_cli
commithash=5ebc489065981a4cd7dbf69a64f8b5532eae5f8d
pkgver=0.9.6
pkgrel=1
pkgdesc="Install, update and manage your Gnome Shell extensions from your terminal !"
arch=("any")
url="https://github.com/essembeh/$pkgname"
license=("Apache")
makedepends=(python-installer python-poetry)
depends=(python python-colorama python-pydantic python-requests python-packaging)
optdepends=("dbus: recommended, handle extensions with DBus")
source=("https://github.com/essembeh/$pkgname/archive/$commithash.zip")
sha256sums=("12bb46ea9466ea1400b0018244a3c8809fc5e90831e30946ba6fa6e0fb739da9")

build() {
    cd $pkgname-$commithash
    poetry build
}

package() {
    cd "$srcdir/$pkgname-$commithash/dist"
    python -m installer --destdir="$pkgdir" *.whl
}
