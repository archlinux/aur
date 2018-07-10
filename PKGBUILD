# Maintainer: liberodark

pkgname=keeper-password-manager
pkgver=13.0.1
pkgrel=1
pkgdesc="Keeper is the world's #1 most downloaded password keeper and secure digital vault for protecting and managing your passwords."
arch=('x86_64')
url="https://keepersecurity.com"
license=('Custom')
depends=('xdg-utils')
source_x86_64=("https://keepersecurity.com/desktop_electron/Linux/repo/deb/keeperpasswordmanager_${pkgver}_amd64.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('2f342f212fca342211adf90e633d557f8619b6737e3652cbb5f6f01e2875d22cf2799b21447e9bef4b3ef81d85407b8ee41937e5b10d577a8d8139813f36f941'
         '03db6ce057c53dacb4f242c131f4f5f599a4b79aa834a9555aa58216084f25c1bd5850968b7a80a5887dec23103df84694f3bbd0718e8fe49d0152f86a1ddc5d')
sha512sums_x86_64=('fef03755c15c94004a977e5750f854486e03e8779c7658e90e62b92bfe722c5d17d9beb6fb4effc62b990449845ece34ff6c3a4cb48b9cc42436eba70548ff3e')
        
package() {
  cd $srcdir
  tar xpvf data.tar.xz
  cp -r usr $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
