# Maintainer: Edison Ibañez <edison@opmbx.org>
pkgname=sqlectron-gui
pkgver=1.13.0
pkgrel=2
pkgdesc="A simple and lightweight SQL client desktop with cross database and platform support."
arch=('i686' 'x86_64')
url="https://sqlectron.github.io/"
license=("MIT")

source=("Sqlectron.sh")
source_x86_64=("https://github.com/sqlectron/$pkgname/releases/download/v$pkgver/Sqlectron-$pkgver.deb")
source_i686=("https://github.com/sqlectron/$pkgname/releases/download/v$pkgver/Sqlectron-$pkgver-ia32.deb")
md5sums=('f0770e47e7ad5926d24cf9953c1ceb71')
md5sums_i686=('4a89f0e1939f575f9a3f17e54228695d')
md5sums_x86_64=('8d825fe5ac38b4cfcaa582579cfe4fb3')

depends=('libnotify')

build() {
  cd "$srcdir"
  tar xf data.tar.xz
}

package() {
  cd "$srcdir"
  install -dm 755 "$pkgdir/opt"
  cp -rf "$srcdir/opt/Sqlectron" "$pkgdir/opt"
  install -dm 775 "$pkgdir/opt/Sqlectron"
  install -dm 755 "$pkgdir/usr/bin/"
  install -Dm 775 "Sqlectron.sh" "$pkgdir/usr/bin/Sqlectron"
  install -Dm 644 "$srcdir/usr/share/applications/Sqlectron.desktop" "$pkgdir/usr/share/applications/Sqlectron.desktop"
  install -dm 755 "$pkgdir/usr/share/doc/sqlectron"
  cp -rf "$srcdir/usr/share/doc/sqlectron" "$pkgdir/usr/share/doc/sqlectron"
  install -Dm 644 "$srcdir/usr/share/icons/hicolor/16x16/apps/Sqlectron.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/Sqlectron.png"
  install -Dm 644 "$srcdir/usr/share/icons/hicolor/24x24/apps/Sqlectron.png" "$pkgdir/usr/share/icons/hicolor/24x24/apps/Sqlectron.png"
  install -Dm 644 "$srcdir/usr/share/icons/hicolor/32x32/apps/Sqlectron.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/Sqlectron.png"
  install -Dm 644 "$srcdir/usr/share/icons/hicolor/48x48/apps/Sqlectron.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/Sqlectron.png"
  install -Dm 644 "$srcdir/usr/share/icons/hicolor/64x64/apps/Sqlectron.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/Sqlectron.png"
  install -Dm 644 "$srcdir/usr/share/icons/hicolor/96x96/apps/Sqlectron.png" "$pkgdir/usr/share/icons/hicolor/96x96/apps/Sqlectron.png"
  install -Dm 644 "$srcdir/usr/share/icons/hicolor/128x128/apps/Sqlectron.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/Sqlectron.png"
  install -Dm 644 "$srcdir/usr/share/icons/hicolor/256x256/apps/Sqlectron.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/Sqlectron.png"
  install -Dm 644 "$srcdir/usr/share/icons/hicolor/512x512/apps/Sqlectron.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/Sqlectron.png"
}

# vim:set ts=2 sw=2 et:
