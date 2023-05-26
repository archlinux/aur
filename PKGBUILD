# Maintainer: Frédéric Lachapelle <frederic.lachapelle7@gmail.com>

pkgname=open-tv-bin
pkgver=0.9.4
pkgrel=1
pkgdesc='Fast & Simple IPTV app'
arch=('x86_64')
url='https://github.com/fredolx/open-tv'
license=('GPL2')
depends=('mpv' 'electron')
source=("https://github.com/Fredolx/open-tv/releases/download/v0.9.4/linux-generic.tar.gz")
sha512sums=('c02d88d95498140e4154dc3e56c3ae47ce7039d4ef7391318351b2e12a38a12f6bc3a10ebb1197e89286ec2f9cdb0ccf7c77b28e5ff7de07d603914d913c879b')

package() {
  find . -not -name 'linux-generic.tar.gz' -type f -delete
  tar -xf linux-generic.tar.gz
  install -d "$pkgdir"/opt/open-tv
  cp -r app "$pkgdir"/opt/open-tv
  install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/open-tv.png
  install -Dm644 open-tv.desktop "${pkgdir}"/usr/share/applications/open-tv.desktop
}
