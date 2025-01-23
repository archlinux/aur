# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgbase=unix-tree-pt-br
pkgname=('unix-tree-pt-br')
pkgver=2.2.1
pkgrel=1
pkgdesc="A directory listing program displaying a depth indented list of files"
arch=('x86_64')
url="https://gitlab.com/OldManProgrammer/unix-tree"
license=('GPL-2.0-or-later')
depends=('glibc')
source=("https://github.com/johnpetersa19/unix-tree-master-pt_br/releases/download/Tree2.2.1-1/unix-tree-master.tar.gz")
sha512sums=('9ea9fbad926b1da545d7b1eb0f19e1c69baebcfc4e192a8075713b556ba9af4f419142d947a4b4111642fd7d633f07f85ffe5be5fd9e03a6c301c477eec87986')

prepare() {
  cd "unix-tree-master"
  sed -i -e '/^CFLAGS/d' -e '/^LDFLAGS/d' Makefile
}

build() {
  cd "unix-tree-master"
  make
}

package() {
  cd "unix-tree-master"
  make PREFIX="${pkgdir}/usr" MANDIR="${pkgdir}/usr/share/man" install
}
