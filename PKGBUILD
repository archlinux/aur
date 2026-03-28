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
# Note: The source URL will work once you Publish the draft release on GitHub
source=("https://github.com/rmia46/quasar/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
        "https://raw.githubusercontent.com/rmia46/quasar/main/LICENSE")
sha256sums=('6cb1524d1081a471d1c64eebd32fabfba553938ff262394b72bc8a58ac9ce560'
            '2c685bb9160a30c7c88334530378ae1dfd3c393af72efe3e48a322ee5fe53e28')

prepare() {
  # Extract the debian package
  ar x "${_pkgname}_${pkgver}_amd64.deb"
  tar -xf data.tar.xz
}

package() {
  # Install the extracted files
  cp -r usr "$pkgdir/"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
