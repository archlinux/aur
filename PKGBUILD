# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=pistol-bin
pkgver=0.5
pkgrel=1
pkgdesc='General purpose file previewer'
arch=('x86_64' 'aarch64' 'armv7l')
url='https://github.com/doronbehar/pistol'
license=('MIT')
depends=('git' 'file')
optdepends=('ranger: file browser to preview files in' 'lf: file browser to preview files in')
conflicts=('pistol' 'pistol-git')
provides=('pistol')
source=(
    LICENSE::https://raw.githubusercontent.com/doronbehar/pistol/master/LICENSE
    README.adoc::https://raw.githubusercontent.com/doronbehar/pistol/master/README.adoc
    "$url/releases/download/v$pkgver/pistol.1.gz"
)
source_x86_64=("$url/releases/download/v$pkgver/pistol-static-linux-x86_64")
source_aarch64=("$url/releases/download/v$pkgver/pistol-static-linux-aarch64")
source_armv7l=("$url/releases/download/v$pkgver/pistol-static-linux-armv7l")
sha256sums=('80ac069f47af945670611015445781a7e1020d7ff6b074f2c01f0160ede64c54'
            'ab6fa6ff1de4aa1f36449f776165dcaddd59f27b031d765e6da72c771d341f1d'
            'e45fa341f7f3a491f0c7274ae1decdd51ebf1af9dddbb659e1e0f4885a09feb2')
sha256sums_x86_64=('0528d3bda1b3731efcb55831dac81d7db3518725610d0e198aa4f402a10b5ef5')
sha256sums_aarch64=('0fbcb6de4fd966c11157b36f7c8c9747325a1188529901efb40d22a693d6a30e')
sha256sums_armv7l=('4fc0e101cfd9a9596d70b58680b981c96df22919c41e1ef11d81c4c54bf51737')

package() {
  install -Dm755 "pistol-static-linux-$CARCH" "$pkgdir/usr/bin/pistol"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.adoc
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/man/man1" pistol.1
}
