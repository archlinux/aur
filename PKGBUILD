# Maintainer: mrabe89 <mrabe@hatdev.de>
# Contributor: guns <self@sungpae.com>
# Contributor: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
_pkgname=go-luks-suspend
pkgname="${_pkgname}-git"
pkgver=1.4.3.c077dcc
pkgrel=1
pkgdesc='Encrypt LUKS volumes on system suspend'
arch=('x86_64')
url='https://github.com/guns/go-luks-suspend'
license=('GPL3')
depends=('systemd' 'cryptsetup' 'mkinitcpio')
makedepends=('go')
install=install
conflicts=('arch-luks-suspend' 'arch-luks-suspend-git' 'go-luks-suspend')
source=("${pkgname%-*}::git+https://github.com/guns/go-luks-suspend#branch=luks2")
md5sums=("SKIP")

build() {
  cd "$srcdir/$_pkgname"

  make clean all
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
