# Maintainer: Davide Depau <davide@depau.eu>
# Contributor: liberodark
# Contributor: daniel666

pkgname=keeper-password-manager
pkgver=14.9.8
pkgrel=1
pkgdesc="Keeper is the world's #1 most downloaded password keeper and secure digital 
 vault for protecting and managing your passwords and other secret information."
arch=('x86_64')
url="https://keepersecurity.com"
license=('Custom')
depends=('xdg-utils')
source=("https://keepersecurity.com/desktop_electron/Linux/repo/deb/keeperpasswordmanager_${pkgver}_amd64.deb")
sha512sums=('ec7a392c256cb122731a3fd97bb965419aef018004ab339ea298b9ca4035a6e50d4308d5e74c29073f0a539b6b528542f7be6408e646392dfe887d632804b2ef')
        
package() {
  cd $srcdir
  tar xpvf data.tar.xz
  cp -r usr $pkgdir
  msg2 "Setting needed '4755' mode to file: chrome-sandbox."
  chmod 4755 $pkgdir/usr/lib/keeperpasswordmanager/chrome-sandbox
}
