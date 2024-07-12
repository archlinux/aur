# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Federico CInelli <cinelli@aur.archlinux.org>
# Contributor: Tom Wambold <tom5760@gmail.com>
# Contributor: Yaohan Chen <yaohan.chen@gmail.com>
pkgname=frogatto
arch=('any')
pkgver=4.0.2
pkgrel=2
pkgdesc="An old-school 2d platformer game, starring a certain quixotic frog"
url="http://www.frogatto.com"
license=('CC-BY-3.0 AND LicenseRef-proprietary')
depends=('anura')
source=($pkgname-$pkgver.tar.gz::"https://github.com/frogatto/frogatto/archive/refs/tags/v$pkgver.tar.gz"
        launcher)
sha512sums=('43e150e4f4685169e68f79b15d92c6d5013276187819efc180b9ccdec31502228766f9f5ec245e1617315a8157139fa992c8b859b26649a5700f23c68dbf8c13'
            '03bc10ae3c15e54de23ddf625b14593a6a504f185747a7b7a9b64741ab8ea3e3994f5cdf914bc394ae67b2e62a5409fb5e90bff8e415463073af596ca84a0b5e')

package() {
  cd $pkgname-$pkgver

  install -Dm755 "$srcdir"/launcher "$pkgdir"/usr/bin/frogatto
  _installdir=$pkgdir/usr/share/anura/modules/frogatto4
  install -Dm644 module.cfg $_installdir/module.cfg
  install -Dm644 master-config.cfg $_installdir/master-config.cfg
  cp -r data images locale music sounds $_installdir

  install -Dm644 images/os/frogatto-icon.png $pkgdir/usr/share/pixmaps/com.frogatto.Frogatto.png
  install -Dm644 FreeDesktop/com.frogatto.Frogatto.desktop $pkgdir/usr/share/applications/com.frogatto.Frogatto.desktop
  install -Dm644 FreeDesktop/com.frogatto.Frogatto.appdata.xml $pkgdir/usr/share/metainfo/comm.frogatto.Frogatto.appdata.xml
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
