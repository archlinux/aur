# Contributor: Christopher Bayliss <christopher.j.bayliss@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xiphos
pkgver=4.0.7
pkgrel=1
pkgdesc="A Bible study tool - This version is built to use GTK3 and WebKit2GTK+."
arch=('i686' 'x86_64')
url="http://xiphos.org"
license=('GPL')
depends=('webkit2gtk' 'libgsf' 'gconf' 'sword' 'biblesync' 'gtkhtml4' 'festival')
makedepends=('gnome-common' 'gnome-doc-utils' 'intltool' 'python2')
provides=('gnomesword')
conflicts=('gnomesword')
source=("xiphos-${pkgver}.tar.gz::https://github.com/crosswire/xiphos/archive/${pkgver}.tar.gz")
md5sums=('b28df49270a2aef4f33297e0d40dd421')

build() {
  cd "xiphos-${pkgver}"
  python2 ./waf --prefix=/usr --gtk=3 --enable-webkit2 configure 
  python2 ./waf --prefix=/usr --gtk=3 --enable-webkit2 build 
}

package() {
  cd "xiphos-${pkgver}"
  python2 ./waf --destdir=$pkgdir --no-post-install install 
}

