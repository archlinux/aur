# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=pistol-bin
pkgver=0.5.3
pkgrel=1
pkgdesc='General purpose file previewer'
arch=('x86_64' 'aarch64' 'armv7l')
url='https://github.com/doronbehar/pistol'
license=('MIT')
optdepends=('ranger: file browser to preview files in' 'lf: file browser to preview files in')
conflicts=('pistol' 'pistol-git')
provides=('pistol')
source=(
    LICENSE::https://raw.githubusercontent.com/doronbehar/pistol/master/LICENSE
    README.adoc::https://raw.githubusercontent.com/doronbehar/pistol/master/README.adoc
    "$url/releases/download/v$pkgver/pistol.1"
)
source_x86_64=("$url/releases/download/v$pkgver/pistol-static-linux-x86_64")
source_aarch64=("$url/releases/download/v$pkgver/pistol-static-linux-aarch64")
source_armv7l=("$url/releases/download/v$pkgver/pistol-static-linux-armv7l")
sha256sums=('80ac069f47af945670611015445781a7e1020d7ff6b074f2c01f0160ede64c54'
            'c301c4484bd3e5c95c7cb08787951272e96fd9c09deb866e07f63a444f2ef738'
            'a59c17a8a7b1f8fb7be9503a75bd1ac877a0e601c53f96801b556846685f8d1e')
sha256sums_x86_64=('50d7c5016e7fa932290c3a54c16933d05b68dbff612ed96fcbfd9fb50074d5fc')
sha256sums_aarch64=('f35bf9980c831576aa812369ab1184aa2f76d85c80c8a9af70ac11c369741207')
sha256sums_armv7l=('562675cfa63cd0a3327aa4e43ca6721e5e267986687fe40a41442dda35230478')

package() {
  install -Dm755 "pistol-static-linux-$CARCH" "$pkgdir/usr/bin/pistol"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.adoc
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/man/man1" pistol.1
}
