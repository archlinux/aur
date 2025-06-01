pkgname=electron-castlab-bin
pkgver=v36.3.2+wvcus
pkgrel=1
arch=("x86_64")
url="https://github.com/castlabs/electron-releases"
license=('GPL')
depends=(c-ares
         gcc-libs
         glibc
         gtk3
         libevent
         libffi
         libpulse
         nss
         zlib)
pkgdesc="Electron for Content Security (ECS) is a fork of Electron created by castLabs to facilitate the use of Google's Widevine Content Decryption Module (CDM) for DRM-enabled playback within Electron"
sha256sums_x86_64=('d50822821f366fd5572205071328334b6d21df42aa2d205edc517272c77aaa28')
source_x86_64=("https://github.com/castlabs/electron-releases/releases/download/$pkgver/electron-$pkgver-linux-x64.zip")

package() {
    install -dm755 "$pkgdir/usr/lib/electron-castlab"
    install -dm755 "$pkgdir/usr/bin"
    
    cd "$srcdir"
    cp -r "$srcdir"/* "$pkgdir/usr/lib/electron-castlab"
    ln -s /usr/lib/electron-castlab/electron "$pkgdir/usr/bin/electroncastlab"
}
