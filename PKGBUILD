# Maintainer: willemw <willemw12@gmail.com>

pkgname=gshowtv
pkgver=1.2.2
pkgrel=1
pkgdesc="TV program schedule viewer and a Personal Video Recorder GUI"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gshowtv"
license=('GPL')
makedepends=('gnome-doc-utils')
depends=('glade-perl' 'gnome-doc-utils' 'gtk2-perl' 'libgnome' 'perl-libintl-perl' 'perl-libwww' 'xmltv')
optdepends=('libnotify: desktop notifications'
            'nautilus: file manager'
            'xmltv-druid: XMLTV configurator')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('600379731e8c8b297b216290773c8f94')

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  #mv "$pkgdir/usr/bin/site_perl/gshowtv" "$pkgdir/usr/bin/"
  #rmdir "$pkgdir/usr/bin/site_perl"

  install -Dm644 README "$pkgdir/usr/share/$pkgname/README"
}

