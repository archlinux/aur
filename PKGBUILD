# Maintainer: Sterophonick
pkgname=nocash2k6
_pkgname='nocash2k6'
pkgver=1.1
pkgrel=1
pkgdesc='Atai 2600 Debugger'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
makedepends=('p7zip')
source=(https://problemkaputt.de/no\$2k6-w.zip
        nocash2k6
        nocash2k6.desktop
        nocash2k6.png)
md5sums=('7876291b6f99ec3ea1fad2bf6a1ddc4b'
         'SKIP'
         'SKIP'
         'SKIP')
noextract=(no\$2k6-w.zip)

prepare() {
  cd $srcdir
  mkdir -p nocash
  7z x no\$2k6-w.zip -aou -onocash
}

package() {
  install -Dm755 nocash2k6 $pkgdir/usr/bin/nocash2k6
  install -Dm644 nocash2k6.desktop $pkgdir/usr/share/applications/nocash2k6.desktop
  install -Dm644 nocash2k6.png $pkgdir/usr/share/pixmaps/nocash2k6.png

  mkdir -p $pkgdir/usr/share/nocash2k6

  cp -r $srcdir/nocash/* $pkgdir/usr/share/nocash2k6
  chmod -R 777 $pkgdir/usr/share/nocash2k6
}
