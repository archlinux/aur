# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=checkupdatify
pkgver=1.1.1
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
sha256sums=('c57daddb414342d7e193ce2d2c837bac84f43ea877848d36c9959d4a944cdcbf')

package() {
  cd "$pkgname-v$pkgver"
  install -Dm755 -t "${pkgdir}/usr/bin" bin/*
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/user" systemd/*
}
