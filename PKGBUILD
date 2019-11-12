# Maintainer:  Dimitris Kiziridis <ragouel@outlook.com>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki at gmail>
# Contributor: Ben Darwin <bcdarwin at gmail>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Lone_Wolf <lonewolf@xs4all.nl>

pkgname=('zeroinstall-injector')
_pkgname=0install
pkgver=2.12
pkgrel=1
pkgdesc='A decentralised loosely-coupled secure installation system'
arch=('i686' 'x86_64')
url="http://0install.net"
license=('GPL2' 'LGPL')
depends=('ocaml-curl' 'ocaml-extlib' 'ocaml-lwt' 'ocaml-ounit' 'ocaml-xmlm' 'ocaml-yojson')
optdepends=('ocaml-lablgtk: provides GUI features'
            'ocaml-obus: for DBUS, packagekit, and NetworkManager integration'
            'xdg-utils: desktop integration'
            'packagekit: packagekit integration')
install="$pkgname.install"
source=("https://github.com/0install/0install/archive/v$pkgver-1.tar.gz")
sha256sums=('317ac6ac680d021cb475962b7f6c2bcee9c35ce7cf04ae00d72bba8113f13559')
build() {
  cd "$_pkgname-$pkgver"-1
  make
}

package() {
  cd "$_pkgname-$pkgver"-1
  make DESTDIR="$pkgdir/" install_system
}
