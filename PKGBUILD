# Maintainer: Nemo <archlinux at captnemo dot in>
# Co-maintainer: Eduard T <edu4rdshl>
pkgname=signal-desktop-beta-bin
pkgrel=2
pkgdesc="Private messaging from your desktop"
arch=('x86_64')
url='https://signal.org'
license=('GPL3')
depends=('libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss')
options=('!strip' '!emptydirs')
provides=('signal-desktop-beta')
conflicts=('signal-desktop-beta')
_pkgver=8.37.0-beta.1
pkgver=${_pkgver/-/}
source=("https://updates.signal.org/desktop/apt/pool/s/signal-desktop-beta/signal-desktop-beta_${_pkgver}_amd64.deb")
sha256sums=('ed4f6fd68b43311d38f481c10c39cb53ff7955978d25d3eec24c89559f685ed3')

package(){
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  # Link to the binary
  install -d "${pkgdir}/usr/bin"
  ln -sf '/opt/Signal Beta/signal-desktop-beta' "${pkgdir}/usr/bin/signal-desktop-beta"
}
