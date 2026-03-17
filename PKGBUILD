pkgname=echomusic-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="🎉 A simple third-party KuGou concept version music player"
arch=('x86_64')
url="https://github.com/hoowhoami/EchoMusic"
license=('Apache')
depends=('glibc')
provides=('echomusic')
conflicts=('echomusic')
source=("EchoMusic-$pkgver-Linux-x86_64.AppImage::https://github.com/hoowhoami/EchoMusic/releases/download/v$pkgver/EchoMusic-$pkgver-Linux-x86_64.AppImage"
"echomusic.desktop")
sha256sums=(
'SKIP'
'SKIP'
)
package() {

install -Dm755 \
"$srcdir/EchoMusic-$pkgver-Linux-x86_64.AppImage" \
"$pkgdir/opt/echomusic/echomusic.AppImage"

install -Dm755 /dev/stdin "$pkgdir/usr/bin/echomusic" <<EOF
#!/bin/sh
exec /opt/echomusic/echomusic.AppImage "\$@"
EOF

install -Dm644 \
"$srcdir/echomusic.desktop" \
"$pkgdir/usr/share/applications/echomusic.desktop"

}