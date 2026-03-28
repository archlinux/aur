# Maintainer: Roman Mia <mail.romanmia@gmail.com>
pkgname=quasar-mips-ide-bin
_pkgname=quasar
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern, high-performance IDE for MIPS32 R2000 assembly (Pre-built binary)"
arch=('x86_64')
url="https://github.com/rmia46/quasar"
license=('custom:QUASAR NON-COMMERCIAL LICENSE')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg')
provides=('quasar-mips-ide')
conflicts=('quasar-mips-ide' 'quasar-mips-ide-git')
source=("https://github.com/rmia46/quasar/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
        "https://raw.githubusercontent.com/rmia46/quasar/main/LICENSE")
sha256sums=('SKIP'
            'SKIP')

package() {
  # Extract the deb package
  tar -xvf data.tar.gz -C "$pkgdir"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
