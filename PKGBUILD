# Maintainer: Frédéric Lachapelle <frederic.lachapelle7@gmail.com>

pkgname=open-tv-bin
pkgver=0.9.3
pkgrel=2
pkgdesc='Fast & Simple IPTV app'
arch=('x86_64')
url='https://github.com/fredolx/open-tv'
license=('GPL2')
depends=('mpv' 'electron')
source=("https://github.com/Fredolx/open-tv/releases/download/v0.9.3/linux-generic.tar.gz")
sha512sums=('e10e5d3e8d9b4c7b24fbdfec6c17e85cf31e88dc27c5312493d354a4b8a43715418a60f1ffd5013eb31ce15a67e09c7cac424c2863d01fd0544b577b8708ad0c')

package() {
  find . -not -name 'linux-generic.tar.gz' -type f -delete
  tar -xf linux-generic.tar.gz
  install -d "$pkgdir"/opt/open-tv
  cp -r app "$pkgdir"/opt/open-tv
  install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/open-tv.png
  install -Dm644 open-tv.desktop "${pkgdir}"/usr/share/applications/open-tv.desktop
}
