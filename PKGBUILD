# Maintainer: koneu <koneu93 AT googlemail DOT com>

pkgname=skype-secure
pkgver=3.1
pkgrel=1
arch=(any)
pkgdesc="Restricting Skype for Linux access"
url="https://wiki.archlinux.org/index.php/skype#Restricting_Skype_access"
license=('custom')
install=sskype.install

depends=(skypeforlinux xorg-xhost sudo)
provides=('sskype')

source=(sskype 05sskype client.conf sskype.desktop)
md5sums=('c062a95a9d0a8a1b465183bc519d4305'
         '20a6224158c7f54fabcbf44c870d0f99'
         '46775f06fd9d6c4ad5ff3a221d4912ff'
         '252c4bf54f773e935c91d10f2476f4fa')

package() {
  install -D "$startdir/sskype" "$pkgdir/usr/bin/sskype"

  install -dm 750 "$pkgdir/etc/sudoers.d"
  install -m 440 "$startdir/05sskype" "$pkgdir/etc/sudoers.d/05sskype"
  
  install -Dm 644 "$startdir/client.conf" "$pkgdir/etc/default/sskype/.config/pulse/client.conf"

  install -Dm 644 "$startdir/sskype.desktop" "$pkgdir/usr/share/applications/sskype.desktop"
}
