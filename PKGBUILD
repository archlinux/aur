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
_pkgver=7.70.0-beta.1
pkgver=${_pkgver/-/}
source=("https://updates.signal.org/desktop/apt/pool/s/signal-desktop-beta/signal-desktop-beta_${_pkgver}_amd64.deb")
sha256sums=('6ee8b865c2cf87d7b2697660142f8f858961bfdf86e3d3f52fcf11036b0a8ac4')

package(){
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
}

install(){
  ln -sf '/opt/Signal Beta/signal-desktop-beta' '/usr/bin/signal-desktop-beta'
}

post_remove(){
  rm -f '/usr/bin/signal-desktop-beta'
}