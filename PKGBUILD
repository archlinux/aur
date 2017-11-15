# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>

pkgname=tap-plugins
pkgver=0.7.3
pkgrel=1
pkgdesc="Tom's LADSPA Plugins"
arch=('x86_64')
url="http://tap-plugins.sourceforge.net/"
license=('GPL')
groups=('ladspa-plugins')
depends=('ladspa')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('113fa021b2a05e2fd3cf35f65e6ca137')

prepare() {
  cd $pkgname-$pkgver
  # correct install path
  sed 's|/usr/local/|$(DESTDIR)/usr/|' -i Makefile
}

build() {
  cd $pkgname-$pkgver
  make 
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
