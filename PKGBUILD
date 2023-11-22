# Maintainer: Eric S. Londres <ericlondres@protonmail.com>
# Maintainer: Mandeep Sangwan <mandeep@sangwan.me>
# Contributor: Joakim Nylén <me@jnylen.nu>
# Contributor: Rashintha Maduneth <rashinthamaduneth@gmail.com>
# Contributor: Dhananjay Balan <mail@dbalan.in>
# Contributor: ahrs

pkgname=mailspring
pkgver=1.13.1
pkgrel=1
pkgdesc="A beautiful, fast and maintained fork of Nylas Mail by one of the original authors."
arch=('x86_64')
license=('custom: GPL3 and (C) 2016-2019 Foundry 376, LLC.')
url="https://getmailspring.com/"
options=('!strip')

source=()

source_x86_64=("https://github.com/Foundry376/Mailspring/releases/download/${pkgver}/mailspring-${pkgver}-amd64.deb")
sha256sums_x86_64=('e9badb3f26e933e295262770e87a6556a1432eb30cc3bfee27f2826668d90504')

depends=("libxss" "libtool" "c-ares" "ctemplate" "tidy" "libxkbfile" "libsecret" "gtk3" "nss" "libglvnd")

optdepends=('libappindicator-gtk3: for system tray support' 'appmenu-gtk-module: for system tray support' "libgnome-keyring: keyrings" "gnome-keyring: keyrings" 'zenity: for showing desktop notifications')

package() {
  cd ${srcdir}
  
  tar -xf data.tar.xz -C ${pkgdir} --exclude='./control'
  chmod go-w "${pkgdir}"/usr "${pkgdir}"/usr/bin
  chmod -R go-w "${pkgdir}"/usr/share
}
