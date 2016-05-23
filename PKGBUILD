# Original Maintainer: mariusn <marius@softpedia.com>
# Maintainer: HanFox <hanfox.co.uk>
# Contributor: Doug Newgard <scimmia22@outlook.com>
 
pkgname=trillian
pkgver=2.0.0.7
pkgrel=2
pkgdesc="A commercial, multi-protocol and cross-platform IM client"
arch=('x86_64')
url="https://www.trillian.im"
license=('Proprietary')
depends=('gtkmm3' 'libzip' 'openssl' 'webkitgtk' 'libnotify' 'libpulse' 'libxss' 'librsvg')
optdepends=('libappindicator-gtk3: tray icon support')
install='trillian.install'
 
source_x86_64=("https://www.trillian.im/get/linux/2.0/${pkgname}_${pkgver}_v5_amd64.deb")
md5sums_x86_64=('39ddb1c10535f56bc3f1fad95344db3a')
 
 
package() {
  tar xvf "$srcdir/data.tar.xz" -C "$pkgdir/"

  libzip_link=/usr/lib/libzip.so.2
  if [ ! -f "$libzip_link" ]; then
    mkdir -p $pkgdir/usr/lib
    ln -s /usr/lib/libzip.so $pkgdir$libzip_link
  fi
}
