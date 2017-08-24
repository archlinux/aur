# Maintainer: Federico Giuliani <federico.giuliani86 at gmail dot com>

pkgname=airsonic
pkgver=10.0.1
pkgrel=1
pkgdesc="A free, web-based media streamer and jukebox."
arch=('any')
url="https://github.com/Airsonic/airsonic/"
license=('GPL3')
depends=('java-runtime-headless')
conflicts=('subsonic' 'subsonic-kang' 'subsonic-kang-git' 'subsonic-beta' 'libresonic')
backup=('var/lib/airsonic/airsonic.sh')
noextract=(airsonic.war)
install=$pkgname.install
source=(https://github.com/airsonic/airsonic/releases/download/v${pkgver}/airsonic.war
        'airsonic.sh'
        'airsonic.service')

package() {
  cd ${srcdir}
  mkdir -p $pkgdir/var/lib/airsonic
  mkdir -p $pkgdir/var/lib/airsonic/playlists
  mkdir -p $pkgdir/usr/lib/systemd/system
  mkdir -p $pkgdir/etc/
  cp * $pkgdir/var/lib/airsonic
  ln -fs /var/lib/airsonic/airsonic.sh $pkgdir/etc/airsonic.conf
  cp $srcdir/airsonic.service $pkgdir/usr/lib/systemd/system
  chmod +x $pkgdir/var/lib/airsonic/airsonic.sh
}

sha256sums=('8c2eaf42437a946f240359e0fbc69e1f82785eb173470082710088447e437ee2'
            'c80475ea59cfb02fd667fafcfc5367513a5d31d98878e2317ef98d47689b7e25'
            '5ba2274f536fb7d16f6c0266500419a0c3834f6acdeeca81ba9b83264e839a1a')
