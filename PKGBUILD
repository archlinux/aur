# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=pistol-bin
pkgver=0.5.2
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
    "$url/releases/download/v$pkgver/pistol.1"
)
source_x86_64=("$url/releases/download/v$pkgver/pistol-static-linux-x86_64")
source_aarch64=("$url/releases/download/v$pkgver/pistol-static-linux-aarch64")
source_armv7l=("$url/releases/download/v$pkgver/pistol-static-linux-armv7l")
sha256sums=('80ac069f47af945670611015445781a7e1020d7ff6b074f2c01f0160ede64c54'
            'ab6fa6ff1de4aa1f36449f776165dcaddd59f27b031d765e6da72c771d341f1d'
            'dc7208489329a73311fd0454684b21140afa76bd23d2e64857ff4acab203d373')
sha256sums_x86_64=('5606571cbd632c798e0ee95615c2121a75abf6d7d198dafa87664b8942c24ae6')
sha256sums_aarch64=('e64692d9564ef47a54b22e95614f388a190fa01b012e86a5961f6041cbdec71d')
sha256sums_armv7l=('cd1e81558ec006b907ac72b3d2fa33b5a297e81a8d9d75419ef538b11bc9e958')

package() {
  install -Dm755 "pistol-static-linux-$CARCH" "$pkgdir/usr/bin/pistol"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.adoc
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/man/man1" pistol.1
}
