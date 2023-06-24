pkgname=kenbunshoku-haki
pkgver=1.1
pkgrel=1
pkgdesc="Monitor system"
arch=(x86_64)
maintainer="Raissa Arcaro Daros <raissa.geek@gmail.com>"
url="https://github.com/Raissadev/monitor-system"
license=(GPL3)
depends=('go' 'libcaca')

source=("https://github.com/Raissadev/monitor-system/releases/download/v$pkgver/kenbunshoku-haki-$pkgver.tar.gz")
sha256sums=('55da8c3e967190c44bada09d57221b9e6e15614244795d208fd5a1b82ed0120d')

build() {
    cd ..
    go build -o "$srcdir/bin/kenbunshoku-haki"
}

package() {
    sudo install -Dm755 "$srcdir/bin/kenbunshoku-haki" "/usr/bin/kenbunshoku-haki"
    img2txt "$srcdir/../etc/mug.png"
}