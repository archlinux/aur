# Maintainer: Nemo <archlinux at captnemo dot in>
# Co-maintainer: Eduard T <edu4rdshl>
pkgname=signal-desktop-beta-bin
pkgrel=1
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url='https://signal.org'
license=('GPL3')
depends=('libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
provides=('signal-desktop-beta')
conflicts=('signal-desktop-beta')
_pkgver=8.25.0-beta.2
pkgver=${_pkgver/-/}
source=("https://updates.signal.org/desktop/apt/pool/s/signal-desktop-beta/signal-desktop-beta_${_pkgver}_amd64.deb")
sha256sums=('8ba4740c2e95295c551a9b4ee9919d9c4c7bbe3c51cdbe3c3fc334dcc7778abb')

package(){
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  # Link to the binary
  install -d "${pkgdir}/usr/bin"
  ln -sf '/opt/Signal Beta/signal-desktop-beta' "${pkgdir}/usr/bin/signal-desktop-beta"
}
