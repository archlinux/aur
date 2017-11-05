# Maintainer: Federico Giuliani <federico.giuliani86 at gmail dot com>

pkgname=airsonic
pkgver=10.1.0
pkgrel=1
pkgdesc="A free, web-based media streamer and jukebox."
arch=('any')
url="https://github.com/Airsonic/airsonic/"
license=('GPL3')
depends=('java-runtime-headless')
conflicts=('subsonic' 'subsonic-kang' 'subsonic-kang-git' 'subsonic-beta' 'libresonic')
backup=('etc/sysconfig/airsonic')
noextract=(airsonic.war)
install=$pkgname.install
source=(https://github.com/airsonic/airsonic/releases/download/v${pkgver}/airsonic.war
        'airsonic-systemd-env'
        'airsonic.service')

package() {
  cd ${srcdir}
  mkdir -p $pkgdir/var/lib/airsonic
  mkdir -p $pkgdir/var/lib/airsonic/playlists
  mkdir -p $pkgdir/usr/lib/systemd/system
  mkdir -p $pkgdir/etc/sysconfig
  cp airsonic.war $pkgdir/var/lib/airsonic
  cp $srcdir/airsonic.service $pkgdir/usr/lib/systemd/system
  cp airsonic-systemd-env $pkgdir/etc/sysconfig/airsonic
}

sha256sums=('bf5f396f0aba49c022e4c3694c94b1a1edc16c4e1a9137062b0f2899368ff04e'
            '0d4115c892b8e78f6443f5550d3c0a018650268fd05eba56fd9aa48b39cdd094'  
            '4af3a549a40a7f1a65688d6f8d60c4b7667ef4f603550842fa7bc51fbdbf27a3')
