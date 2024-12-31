# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=checkupdatify
pkgver=1.0.0
pkgrel=1
pkgdesc='A collection of scripts that notify you of pending updates to your Arch Linux system'
url='https://gitlab.com/protist/checkupdatify'
arch=('any')
license=('GPL3')
depends=('yay')
optdepends=('terminator: the update command is sent to this terminal emulator by default'
            'libnotify: provides a notification for completion of upgrade(s)'
            'archlinux-artwork: provides icon for notifications')
source=("https://gitlab.com/protist/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('6063430cf7dc69b01fd7db258fb2a4d1c2fac91199d6597b7af508a906735345')

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 -t "${pkgdir}/usr/bin" bin/*
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/user" systemd/*
}
