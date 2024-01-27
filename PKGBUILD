# Maintainer: Frédéric Lachapelle <frederic.lachapelle7@gmail.com>

pkgname=open-tv-bin
pkgver=0.9.8
pkgrel=2
pkgdesc='Fast & Simple IPTV app'
arch=('x86_64')
url='https://github.com/fredolx/open-tv'
license=('GPL2')
depends=('mpv' 'electron')
source=("https://github.com/Fredolx/open-tv/releases/download/v0.9.8/linux-generic.tar.gz")
sha512sums=('dc50a4b6387a0b337c85daf7c93aa7e9ab3c1e6f1ae145971892abb9e24fba98ada1ac9bd66d60202421d7f342f8e84fb9db964c7e7c4fc5fde18abc8e4318e6')

package() {
  find . -not -name 'linux-generic.tar.gz' -type f -delete
  tar -xf linux-generic.tar.gz
  install -d "$pkgdir"/opt/open-tv
  cp -r app "$pkgdir"/opt/open-tv
  install -Dm644 icon.png "${pkgdir}"/usr/share/pixmaps/open-tv.png
  install -Dm644 open-tv.desktop "${pkgdir}"/usr/share/applications/open-tv.desktop
}
