# Maintainer: Det <nimetonmaili g-mail>
# Contributor: Jose Riha <jose1711 gmail com>
# Contributor: max1m <keyworker@rambler.ru>

pkgname=utorrent
pkgver=3.4.3.40760
pkgrel=1
pkgdesc="The world's most popular BitTorrent client (Wine version)"
arch=('i686' 'x86_64')
url="https://www.utorrent.com/"
license=('freeware')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils' 'wine')
install=$pkgname.install
source=("uTorrent-$pkgver.exe::http://download-new.utorrent.com/endpoint/utorrent/os/windows/track/stable/"
        'uTorrent'
        'uTorrent.desktop'
         uTorrent_{16,24,32,48,128,256}.png)
md5sums=('SKIP'
         '7a546b182bd179a0042bee3ebf565e3e'
         '04e26013823d543a66160a1ce80eb781'
         '297643387d8248b51880e376f226fa27'
         '9cc7a34a18f015eb6d416d18ced29560'
         '6b693c028c27dacf3a8ca735000f98fd'
         '8a3b547675b039c8eedf307f1cd4bcc9'
         '24519eea2d1078524c724b62004a1ef8'
         'a112a1f05bb4e6ef5212b56bc5a2b58e')

package() {
  msg2 "Installing launcher..."
  install -Dm755 uTorrent "$pkgdir"/usr/bin/uTorrent
  ln -s uTorrent "$pkgdir"/usr/bin/$pkgname

  msg2 "Installing program..."
  install -Dm644 uTorrent-$pkgver.exe "$pkgdir"/usr/share/utorrent/uTorrent.exe

  msg2 "Installing .desktop..."
  install -Dm644 uTorrent.desktop "$pkgdir"/usr/share/applications/uTorrent.desktop

  msg2 "Installing icons..."
  for i in 16x16 24x24 32x32 48x48 128x128 256x256; do
    install -Dm644 uTorrent_${i/x*}.png "$pkgdir"/usr/share/icons/hicolor/$i/apps/uTorrent.png
  done
}
