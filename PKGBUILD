# Maintainer:  Ben Darwin <bcdarwin at gmail>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>

pkgname=zeroinstall-injector
_pkgname=0install
pkgver=2.6.1
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
sha256sums=('7f691924616c1f7154ac53f4904b63e9a801f4ee3e470f9d641d39fc94e274a2'
            'SKIP')

build() {
  cd $_pkgname-$pkgver
  make || return 1
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir/" install_system
}
