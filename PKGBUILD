# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=pistol-bin
pkgver=0.6.0
pkgrel=1
pkgdesc='General purpose file previewer'
arch=('x86_64' 'aarch64' 'armv7l')
url='https://github.com/doronbehar/pistol'
license=('MIT')
optdepends=('ranger: file browser to preview files in' 'lf: file browser to preview files in')
conflicts=('pistol' 'pistol-git')
provides=('pistol')
source=(
    "$url/raw/refs/tags/v$pkgver/README.adoc"
    "$url/releases/download/v$pkgver/pistol.1"
)
source_x86_64=("$url/releases/download/v$pkgver/pistol-static-linux-x86_64")
source_aarch64=("$url/releases/download/v$pkgver/pistol-static-linux-aarch64")
source_armv7l=("$url/releases/download/v$pkgver/pistol-static-linux-armv7l")
sha256sums=('397e025e8ecc595d1dcf48307e17f885a747349826bf2c9c8bb5948dbe41713e'
            '83900c0e151dca866785ace057b7dff9e9431db83aa6aca252564775543211e4')
sha256sums_x86_64=('74bc6216ae1024cf10db9e32e53f84114be15a6cc2c5bff1a991a660937a9819')
sha256sums_aarch64=('5cacca489b40d0f34eb4f006a0ad0cd640414557fa8dc87d224ff56ef370686f')
sha256sums_armv7l=('578e59d86082157f3a759bc0cc12b86518d131bb24d1270dbd4304e9fe256c71')

package() {
    install -Dm755 "pistol-static-linux-$CARCH" "$pkgdir/usr/bin/pistol"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.adoc
    install -Dm644 -t "$pkgdir/usr/share/man/man1" pistol.1
}
