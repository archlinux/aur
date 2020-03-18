# Maintainer: Roland Auer <xxr01i1xx@tuta.io>

pkgname=mailspring-new
pkgver=1.7.4
pkgrel=2
pkgdesc="A beautiful, fast and maintained fork of Nylas Mail by one of the original authors."
arch=('x86_64')
license=('custom: GPL3 and (C) 2016-2020 Foundry 376, LLC.')
url="https://getmailspring.com/"

source=()
sha256sums_x86_64=('7c92cdc93151c293fe2e4975be3668c950dbb4dec492f5c955136dccee96a12d')

source_x86_64=("https://github.com/Foundry376/Mailspring/releases/download/${pkgver}/mailspring-${pkgver}-amd64.deb")
depends=("libsecret" "gtk3" "nss" "libtool" "libxss" "c-ares" "libxkbfile" "libglvnd")

optdepends=("libappindicator-gtk3: for system tray support" "libgnome-keyring: keyrings" "gnome-keyring: keyrings")
package() {
        cd ${srcdir}
        tar xf data.tar.xz -C ${pkgdir} --exclude='./control'
        chmod -R go-w "${pkgdir}"/usr
}
