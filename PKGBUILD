# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=checkupdatify
pkgver=1.1.0
pkgrel=1
pkgdesc='A collection of scripts that notify you of pending updates to your Arch Linux system'
url='https://gitlab.com/protist/checkupdatify'
arch=('any')
license=('GPL-3.0-only')
depends=('gawk' 'yay')
optdepends=('terminator: the update command is sent to this terminal emulator by default'
            'libnotify: provides a notification for completion of upgrade(s)'
            'archlinux-artwork: provides icon for notifications')
source=("https://gitlab.com/protist/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('b2a8e18bb9cd2ce3d7a7fff34ec5edf56ded6acb7349dc34c0dc5fc208254500')

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 -t "${pkgdir}/usr/bin" bin/*
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/user" systemd/*
}
