# Contributor: Christopher Bayliss <christopher.j.bayliss@gmail.com>
pkgname=xiphos-gtk3
pkgver="4.0.4"
pkgrel=1
pkgdesc="A Bible study tool - This version is built to use GTK3 and WebKit2GTK+."
arch=('i686' 'x86_64')
url="http://xiphos.org"
license=('GPL')
depends=('webkit2gtk' 'libgsf' 'gconf' 'sword' 'biblesync' 'gtkhtml4' 'festival')
makedepends=('gnome-common' 'gnome-doc-utils' 'intltool' 'subversion')
provides=('gnomesword' 'xiphos' 'xiphos-svn')
conflicts=('gnomesword' 'xiphos' 'xiphos-svn')
install=xiphos-gtk3.install
source=('http://downloads.sourceforge.net/project/gnomesword/Xiphos/4.0.4/xiphos-4.0.4-20150830.tar.gz')
md5sums=('a1d88b7d6812fd261d71a229999c669d')

build() {
  cd "$srcdir/xiphos-$pkgver"
  CXX=g++ python2 ./waf --prefix=/usr --gtk=3 --enable-webkit2 configure 
  python2 ./waf --prefix=/usr --gtk=3 --enable-webkit2 build 
}

package() {
  cd "$srcdir/xiphos-$pkgver"
  python2 ./waf --destdir=$pkgdir --no-post-install install 
}

