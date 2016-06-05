 
pkgname=stremio-beta
pkgver=3.6.1
pkgrel=1
pkgdesc="Watch instantly all the video content you enjoy in one place."
arch=('x86_64')
url="https://strem.io"
depends=('ffmpeg' 'gconf')
license=('custom')
install=stremio-beta.install
source=("http://dl.strem.io/Stremio${pkgver}.linux.tar.gz"
        "https://strem.io/favicon-32x32.png"
        "https://strem.io/favicon-96x96.png"
        "stremio-beta.desktop")
md5sums=('b96b2e0b4d068d4daf8bd339f4b40b0c'
         '17a3ae27d06908138317c3a9b8d03898'
         'e3b38592637449733618d73b45293b09'
         'a9381ff162484cd8c847eaa364e51e62')

prepare() {
  sed -i "s#\$(dirname \$0)#/usr/share/stremio-beta#" Stremio.sh
}

package() {
  install -Dm644 stremio-beta.desktop "$pkgdir/usr/share/applications/stremio-beta.desktop"
  install -Dm644 favicon-32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/stremio-beta.png"
  install -Dm644 favicon-96x96.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/stremio-beta.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/stremio-beta/LICENSE"
  install -Dm755 Stremio.sh "$pkgdir/usr/bin/stremio-beta"

  install -dm755 "$pkgdir/usr/share/stremio-beta"

  install -Dm644 content_shell.pak "$pkgdir/usr/share/stremio-beta/"
  install -Dm644 icudtl.dat "$pkgdir/usr/share/stremio-beta/"
  install -Dm644 libgcrypt.so.11 "$pkgdir/usr/share/stremio-beta/"
  install -Dm644 libnode.so "$pkgdir/usr/share/stremio-beta/"
  install -Dm644 libnotify.so.4 "$pkgdir/usr/share/stremio-beta/"
  install -Dm644 natives_blob.bin "$pkgdir/usr/share/stremio-beta/"
  install -Dm644 snapshot_blob.bin "$pkgdir/usr/share/stremio-beta/"
  install -Dm755 Stremio-runtime "$pkgdir/usr/share/stremio-beta/"
  install -Dm644 version "$pkgdir/usr/share/stremio-beta/"

  cp -pr locales "$pkgdir/usr/share/stremio-beta/"
  cp -pr resources "$pkgdir/usr/share/stremio-beta/"
  cp -pr WCjs "$pkgdir/usr/share/stremio-beta/"
}