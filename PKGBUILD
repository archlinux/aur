# Maintainer: Carlo Teubner <carlo at cteubner dot net>
# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Andrey Solomatin
# Contributor: carstene1ns
# Contributor: Lukas Fleischer
# Contributor: Geoffrey Teale
# Contributor: Mark, Huo Mian
# Contributor: Biginoz
# Contributor: Mattias Andrée

pkgname=gammastep
pkgver=2.0
pkgrel=2
pkgdesc="Adjusts the color temperature of your screen according to your surroundings."
arch=('x86_64')
url="https://gitlab.com/chinstrap/${pkgname}"
license=('GPL3')
depends=('glib2' 'wayland' 'libdrm' 'libxxf86vm' 'geoclue')
optdepends=('python-gobject: for gammastep-indicator'
            'python-xdg: for gammastep-indicator'
            'gtk3: for gammastep-indicator')
makedepends=('intltool' 'python' 'git' 'systemd')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('f751205b30b1efc41110f12b5fa90316920a0c55120fe9c0ea580a93249c9158')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
