# Maintainer :  Biginoz 
# Contributor :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Mélanie Chauvel (ariasuni) <perso@hack-libre.org>


pkgname=whalebird-bin
_name="${pkgname%-bin}"

pkgver=4.7.4
#_ver=4.6.0-rc.1
#pkgver="${_ver/-}"
pkgrel=1

pkgdesc='Electron based multi-platform client for Mastodon, Misskey & Pleroma'
arch=('x86_64')
url="https://$_name.social"
license=('MIT')

provides=("$_name")
conflicts=("$_name")

depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')

_url="https://github.com/h3poteto/$_name-desktop/releases/download/$pkgver/${_name^}-$pkgver-linux-x64.rpm"
source=("$_url")
sha256sums=('339bb5f9758b45e4c20b2a96fb2a02a4567660b414624625452ce109f5e3d43a')
#_url="https://github.com/h3poteto/$_name-desktop/releases/download/$_ver/${_name^}-$_ver-linux-x64.rpm"
#source=("$_url")
#sha256sums=($(curl -sL "$_url.shasum" | grep "${_name^}-$_ver-linux-x64.rpm" | cut -d\  -f1))


package() {
  install -Dm644 "opt/${_name^}/LICENSE"* -t"$pkgdir/usr/share/licenses/$_name/"
  cp -R usr/share/* "$pkgdir/usr/share/"
  cp -R opt "$pkgdir/"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/${_name^}/$_name" "$pkgdir/usr/bin/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
