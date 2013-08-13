# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>

pkgname=tap-plugins
pkgver=0.7.2
pkgrel=1
pkgdesc="Tom's LADSPA Plugins"
arch=('i686' 'x86_64')
url="http://tap-plugins.sourceforge.net/"
license=('GPL')
groups=('ladspa-plugins')
depends=('ladspa')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('354b171e580cfad6bad87c26a79ef273')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # correct install path
  sed 's|/usr/local/|$(DESTDIR)/usr/|' -i Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
