# Maintainer: Akira Fukushima <h3.poteto@gmail.com>
pkgname=whalebird
pkgver=4.4.2
pkgrel=1
pkgdesc="An Electron based Mastodon, Pleroma and Misskey client"
arch=('x86_64')
url="https://whalebird.social"
license=('MIT')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt' 'libxss' 'minizip' 'nss' 'snappy' 're2' 'libnotify' 'libvpx')
makedepends=('tar')
provides=('whalebird')
source=("https://github.com/h3poteto/whalebird-desktop/releases/download/$pkgver/Whalebird-$pkgver-linux-x64.tar.bz2"
        whalebird.desktop)
md5sums=('7296c54bc3a94deb1ec0f4c690fe8422'
         '2cf7ef689d208d2fa41ce3622dce3545')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share"
  mv "Whalebird-${pkgver}-linux-x64" "${pkgdir}/usr/share/${pkgname}"
  ln -sf "/usr/share/${pkgname}/whalebird" "${pkgdir}/usr/bin/whalebird"
  install -Dm644 -t "${pkgdir}/usr/share/applications" whalebird.desktop
}
