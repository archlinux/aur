# Maintainer: mak <mak@localhost>
pkgname=uncharted-pc-bin
pkgver=0.3.6.linux.102
pkgrel=1
pkgdesc="Uncharted: The Nathan Drake Collection native PC port (requires your own game dump)"
arch=('x86_64')
url="https://github.com/spacepepperoni/uncharted_Linux"
license=('GPL-2.0-or-later')
depends=('glibc' 'gcc-libs' 'vulkan-icd-loader')
provides=('uncharted-pc')
conflicts=('uncharted-pc')
options=('!strip')
source=("uncharted-linux.tar.gz::https://github.com/spacepepperoni/uncharted_Linux/releases/download/v0.3.6-linux.102/uncharted-linux.tar.gz"
        'LICENSE'
        'uncharted-pc'
        'uncharted-pc.desktop')
sha256sums=('23f2e49b082e1c0aa651349a2c8682fd735569076945ce81ee6415aba2a50928'
            'edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6'
            'e7133ef41a84f476ed2d4c6c05b5a9172c1943c7dbf4c77959dc582f4fc37c35'
            '9aa852da55016b4233d6abd78cb9d5d75e88655f0c3b03a4626ac6ad899b1a1f')

package() {
  install -d "$pkgdir/opt/ports/uncharted-pc"
  cp -a "$srcdir/uncharted-linux/." "$pkgdir/opt/ports/uncharted-pc/"
  install -Dm755 "$srcdir/uncharted-pc" "$pkgdir/usr/bin/uncharted-pc"
  install -Dm644 "$srcdir/uncharted-pc.desktop" \
    "$pkgdir/usr/share/applications/uncharted-pc.desktop"
  install -Dm644 "$pkgdir/opt/ports/uncharted-pc/launcher/uncharted.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/uncharted-pc.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
