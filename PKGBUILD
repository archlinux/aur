# Maintainer: Frédéric Lachapelle <frederic.lachapelle7@gmail.com>

pkgname=open-tv-bin
pkgver=0.9.8
pkgrel=1
pkgdesc='Fast & Simple IPTV app'
arch=('x86_64')
url='https://github.com/fredolx/open-tv'
license=('GPL2')
depends=('mpv' 'electron')
source=("https://github.com/Fredolx/open-tv/releases/download/v0.9.8/linux-generic.tar.gz")
sha512sums=('80b658dcae7d9a6fc6c09522e8bc9abeb19862a600eb366022f31ce7ea9ea9095476d1d3c4863a157d65159ce2e90f9f3ca19dee6a9e98324c7b787c2a44502d')

package() {
  find . -not -name 'linux-generic.tar.gz' -type f -delete
  tar -xf linux-generic.tar.gz
  install -d "$pkgdir"/opt/open-tv
  cp -r app "$pkgdir"/opt/open-tv
  install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/open-tv.png
  install -Dm644 open-tv.desktop "${pkgdir}"/usr/share/applications/open-tv.desktop
}
