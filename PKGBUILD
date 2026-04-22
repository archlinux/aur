pkgname=electron-castlab-bin
pkgver=v41.1.1+wvcus
pkgrel=2
pkgdesc="Electron for Content Security (ECS) is a fork of Electron created by castLabs to facilitate the use of Google's Widevine Content Decryption Module (CDM) for DRM-enabled playback within Electron"
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
sha256sums=('354a67d856e5940040371daa01328a80d7184c564f746f5565e4038c126d203c'
            'b3be2089b97573fc4bd8e5e9b9ded130c9b8c665eeee73d6fde78f1fbbdca0b6'
            '27eee4f74b719af2c24e1ca45ea6c5fc598863f5dba49180e2c22510c42be3c3')
sha256sums_x86_64=('965acc95310d8ad31b64e4e490a0a658eb1373885d142227dd50cb63b5ffc260')
source_x86_64=("https://github.com/castlabs/electron-releases/releases/download/$pkgver/electron-$pkgver-linux-x64.zip")
source=("electroncastlab" "electroncastlab.desktop" "linux-app-id.js")

package() {
    install -dm755 "$pkgdir/usr/lib/electron-castlab"
    install -dm755 "$pkgdir/usr/bin"
    
    cd "$srcdir"
    cp -r "$srcdir"/* "$pkgdir/usr/lib/electron-castlab"
    install -Dm755 "$srcdir/electroncastlab" "$pkgdir/usr/bin/electroncastlab"

   # Desktop Entry
   install -Dm644 "$srcdir/electroncastlab.desktop" \
        "$pkgdir/usr/share/applications/electroncastlab.desktop"
   sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/electroncastlab.desktop"
}
