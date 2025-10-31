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
_pkgver=7.78.0-beta.1
pkgver=${_pkgver/-/}
source=("https://updates.signal.org/desktop/apt/pool/s/signal-desktop-beta/signal-desktop-beta_${_pkgver}_amd64.deb")
sha256sums=('f38c71920cba7b836a7b7e096642d174ca0846b18f31d9d6f606eb8158a7fa38')

package(){
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  # Link to the binary
  install -d "${pkgdir}/usr/bin"
  ln -sf '/opt/Signal Beta/signal-desktop-beta' "${pkgdir}/usr/bin/signal-desktop-beta"
}
