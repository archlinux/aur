# Maintainer: Berfin <3a33oxx40@mozmail.com>
# Previous Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: St�phane Gaudreault <stephane.gaudreault@gmail.com>

pkgname=latencytop-bin
pkgver=0.5.0.0.1
_pkgver="latencytop_0.5.0-0.1~bpo11+1"
pkgrel=2
pkgdesc="A tool for software developers, aimed at identifying where system latency occurs."
arch=('x86_64')
provids=("latencytop")
url="http://ftp.de.debian.org/debian/pool/main/l/latencytop" # used to be http://www.latencytop.org but Intel appears to have killed it
depends=('gtk2' 'ncurses' 'gdk-pixbuf2' 'glib2')
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/l/latencytop/${_pkgver}_amd64.deb")
sha256sums=('da73be7742cb0afa9a8b976591ebec016fe56f6fe38ab3fa0283fcc248a50fff')

package() {
  tar -xvf data.tar.xz
  install -Dm755 "${srcdir}"/usr/sbin/latencytop  "${srcdir}"/usr/bin/latencytop
  cp -r "${srcdir}"/usr/share "${pkgdir}"/usr
}
