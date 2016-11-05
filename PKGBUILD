
pkgname=kaku-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="The next generation music client."
# TODO: add 32 bit
arch=('x86_64')
url="http://kaku.rocks"
license=('MIT')
depends=('gconf' 'gtk2' 'fuse' 'xdg-utils' 'libxtst' 'libxss' 'nss' 'alsa-lib')
optdepends=('xdialog: .desktop file installation dialog'
            'zenity: .desktop file installation dialog'
            'kdebase-kdialog: .desktop file installation dialog')
conflicts=('kaku')
options=(!strip)
noextract=("Kaku-$pkgver-x86_64.AppImage")
source=("https://github.com/EragonJ/Kaku/releases/download/$pkgver/Kaku-$pkgver-x86_64.AppImage"
        "https://raw.githubusercontent.com/EragonJ/Kaku/master/LICENSE")
sha1sums=('117924c08c7a85843803693fc62b74bf9806b75b'
          'c83f356e593dd80c05d6b5cbc1769b3e5a2f3c10')

package() {
  install -d "$pkgdir"/{opt/kaku,usr/bin}

  install -m755 Kaku-$pkgver-x86_64.AppImage "$pkgdir"/opt/kaku
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  ln -s /opt/kaku/Kaku-$pkgver-x86_64.AppImage "$pkgdir"/usr/bin/kaku
}
