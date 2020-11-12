# Maintainer: Morgan <morganamilo@archlinux.org>
pkgname=paru-bin
pkgver=1.1.1
pkgrel=1
pkgdesc='AUR helper based on yay'
url='https://github.com/morganamilo/paru'
source=("$pkgname-$pkgver.tar.zst::https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru.tar.zst")
backup=("etc/paru.conf")
arch=('x86_64')
license=('GPL3')
depends=('git' 'pacman')
optdepends=('asp: downloading repo pkgbuilds' 'bat: colored pkgbuild printing')
conflicts=('paru')
provides=('paru')
sha256sums=('61791fc3c5d8c68a24d5dbf7fef161ea04e40cc70e2c81fa2941454eb76a4904')

package() {
  cd "$srcdir/"

  install -Dm755 paru "${pkgdir}/usr/bin/paru"
  install -Dm644 paru.conf "${pkgdir}/etc/paru.conf"

  install -Dm644 man/paru.8 "$pkgdir/usr/share/man/man8/paru.8"
  install -Dm644 man/paru.conf.5 "$pkgdir/usr/share/man/man5/paru.conf.5"

  install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/paru.bash"
  install -Dm644 completions/fish "${pkgdir}/usr/share/fish/completions/paru.fish"
  install -Dm644 completions/zsh "${pkgdir}/usr/share/zsh/functions/Completion/Linux/_paru"
}
