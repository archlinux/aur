# Maintainer: Luke Arms <luke@arms.to>
# Contributor: dustball

pkgname=quicktile
pkgver=0.4.0
pkgrel=2
url="https://github.com/ssokolow/quicktile"
pkgdesc="Adds window-tiling hotkeys to any X11 desktop"
arch=('any')
license=('GPL2')
depends=('python' 'gtk3' 'libwnck3' 'python-gobject' 'python-xlib')
optdepends=('python-dbus: required if you want to interact with QuickTile over D-Bus')
makedepends=('python-setuptools')
conflicts=('quicktile-git')
source=(
  "https://github.com/ssokolow/quicktile/archive/v${pkgver}.tar.gz"
)
sha512sums=(
  '4aecbd3433d28872c7c2e9a59eaf0d907a901c29bafa900f76c8f9a074450577522037d89cb6a206807df5f6086c0425da847ec6f26c88431e0bb6183b2631f2'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
