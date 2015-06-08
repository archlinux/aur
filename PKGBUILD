# Maintainer: Menche <menche_mt at yahoo dot com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Andrea Scarpino
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: TripleE <eric1548@yahoo.com>

pkgname=xiphos
pkgver=4.0.2
pkgrel=1
pkgdesc="Bible study tool for GTK+"
arch=('x86_64' 'i686')
url="http://xiphos.org/"
depends=('webkitgtk2' 'libgsf' 'libglade' 'gtkhtml3' 'sword' 'biblesync')
makedepends=('gnome-doc-utils' 'intltool' 'python2')
license=('GPL')
conflicts=('gnomesword')
provides=('gnomesword')
replaces=('gnomesword')
install=xiphos.install
source=("http://downloads.sourceforge.net/gnomesword/$pkgname-$pkgver-20150415.tar.gz")
md5sums=('d5151d06bc701c82f9a1fa7f81214fe1')

build() {
  cd "$pkgname-$pkgver"

  sed -i '0,/python/s//python2/' waf
  ./waf configure --gtk=2 --prefix=/usr
  ./waf build
}

package() {
  cd "$pkgname-$pkgver"

  ./waf install --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
