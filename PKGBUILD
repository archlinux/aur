# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=worldpossible-scriptlauncher
pkgver=1.0.1
pkgrel=1
pkgdesc="A tool for running shell scripts with root privileges"
arch=('any')
url="https://github.com/endlessm/worldpossible-scriptlauncher"
license=('GPL2')
makedepends=('meson' 'python')
source=(${url}/archive/${pkgver}.tar.gz)
sha256sums=('75fb036f066019582312504e37b6f3fcc3cef0c278ad3d387a75ad746a71be11')

build() {
    arch-meson ${pkgname%-git}-$pkgver build
    meson compile -C build
}

package() {
  cd "$srcdir"
    DESTDIR="${pkgdir}" ninja -C build install
}
