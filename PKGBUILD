# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=master-key
pkgver=1.9.1
pkgrel=1
pkgdesc="A password manager application"
arch=('any')
url="https://gitlab.com/guillermop/master-key"
license=('GPL-3.0-or-later')
depends=('libadwaita' 'python-gobject' 'libpwquality' 'sqlcipher' 'tcl')
makedepends=('meson' 'gobject-introspection' 'blueprint-compiler')
checkdepends=('appstream-glib' 'desktop-file-utils')
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar)
b2sums=('00e2decc56ab950b5acde58c946e5033fb6ad4827d69c8aad1d2b2e79104ef14ab85a4d5b20d40fefbd8a314b306a20f5266e6bddbebdaef1e5cf81aa17ad819')

build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}





