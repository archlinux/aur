# Original Maintainer: mariusn <marius@softpedia.com>
# Previous Maintainer: HanFox <hanfox.co.uk>
# Maintainer: Xyon <admin@jbladen.co.uk>
# Contributor: Doug Newgard <scimmia22@outlook.com>
 
pkgname=trillian
pkgver=6.0.0.1
pkgrel=1
pkgdesc="A commercial, multi-protocol and cross-platform IM client"
arch=('x86_64')
url="https://www.trillian.im"
license=('Proprietary')
depends=('gtkmm3' 'libzip' 'openssl' 'webkitgtk' 'libnotify' 'libpulse' 'libxss' 'librsvg')
optdepends=('libappindicator-gtk3: tray icon support')
install='trillian.install'
 
source_x86_64=("https://www.trillian.im/get/linux/6.0/${pkgname}_${pkgver}_amd64.deb")
md5sums_x86_64=('6fd52b483be92adc25d511b24db4457e')
 
 
package() {
  tar xvf "$srcdir/data.tar.xz" -C "$pkgdir/"

  libzip_link=/usr/lib/libzip.so.2
  if [ ! -f "$libzip_link" ]; then
    mkdir -p $pkgdir/usr/lib
    ln -s /usr/lib/libzip.so $pkgdir$libzip_link
  fi
}
