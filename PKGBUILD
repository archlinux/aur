pkgname=my-own-repo-web-interface
pkgver=0.2
pkgrel=1
pkgdesc="Custom user repo interface (pacman/rpm/deb)"
arch=(i686 x86_64)
url="http://code.google.com/p/archlinux-stuff/wiki/MyOwnRepo"
license=('GPL')
depends=(perl php perl-dbd-sqlite)
backup=(srv/my-own-repo/config.php)
options=()
install=my-own-repo-web-interface.install
source=(http://archlinux-stuff.googlecode.com/files/my-own-repo-web-interface-$pkgver.tar.gz)
md5sums=('9fb3c8aa5a4140005f5fd5b79a8d05fc')

build() {
  cd $startdir/src

  install -d -m0755 $startdir/pkg/usr/lib/my-own-repo-web-interface && \
  install -d -m0755 $startdir/pkg/usr/bin && \
  install -d -m0755 $startdir/pkg/srv/my-own-repo && \
  install -m0755 my-own-repo-update.pl $startdir/pkg/usr/bin/my-own-repo-update && \
  install -m0755 *.pm $startdir/pkg/usr/lib/my-own-repo-web-interface/ && \
  install -m0644 *.php $startdir/pkg/srv/my-own-repo/ && \
  install -m0644 *.css $startdir/pkg/srv/my-own-repo/
}
