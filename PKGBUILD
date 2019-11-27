# Maintainer: daniel666
# Contributor: Davide Depau <davide@depau.eu>
# Contributor: liberodark

pkgname=keeper-password-manager
pkgver=14.9.9
pkgrel=1
pkgdesc="Keeper is the world's #1 most downloaded password keeper and secure digital 
 vault for protecting and managing your passwords and other secret information."
arch=('x86_64')
url="https://keepersecurity.com"
license=('Custom')
depends=('xdg-utils')
source=("https://keepersecurity.com/desktop_electron/Linux/repo/deb/keeperpasswordmanager_${pkgver}_amd64.deb")
sha512sums=('60437f858e3f6332870cd2ea979ede137847a5e62971858cae97d0d786344e7852c6c115d91ef3509fe5cfdea5bdbb90f27106fddc60dbdeb5369ab602891038')
        
package() {
  cd $srcdir
  tar xpvf data.tar.xz
  cp -r usr $pkgdir
  msg2 "Setting needed '4755' mode to file: chrome-sandbox."
  chmod 4755 $pkgdir/usr/lib/keeperpasswordmanager/chrome-sandbox
}
