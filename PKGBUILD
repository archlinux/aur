# Maintainer:  Tatsuyuki Ishi <ishitatsuyuki at gmail>
# Contributor: Ben Darwin <bcdarwin at gmail>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>

pkgname=zeroinstall-injector
_pkgname=0install
pkgver=2.11
pkgrel=1
pkgdesc="A decentralised loosely-coupled secure installation system"
arch=('i686' 'x86_64')
url="http://0install.net"
license=('GPL2' 'LGPL')
depends=('ocaml-curl' 'ocaml-extlib' 'ocaml-lwt'
         'ocaml-ounit' 'ocaml-xmlm' 'ocaml-yojson')
optdepends=('ocaml-lablgtk: provides GUI features'
            'ocaml-obus: for DBUS, packagekit, and NetworkManager integration'
            'xdg-utils: desktop integration'
            'packagekit: packagekit integration')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/zero-install/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.bz2"
        "http://downloads.sourceforge.net/zero-install/$_pkgname/$pkgver/$_pkgname-$pkgver.tar.bz2.sig")
sha256sums=('194b675c48556a3b9aee6b4a2478a521fafa66c0d871ef64349dc3baede28006'
            'SKIP')
build() {
  cd $_pkgname-$pkgver
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir/" install_system
}
