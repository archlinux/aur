# Maintainer: Morgan <morganamilo@archlinux.org>
pkgname=paru-bin
_rel=-1
pkgver=2.0.3
pkgrel=3
pkgdesc='Feature packed AUR helper'
url='https://github.com/morganamilo/paru'
source_x86_64=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver$_rel-x86_64.tar.zst")
source_aarch64=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver$_rel-aarch64.tar.zst")
source_armv7h=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver$_rel-armv7h.tar.zst")
backup=("etc/paru.conf")
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL-3.0-or-later')
depends=('git' 'pacman' 'libalpm.so>=14-64')
optdepends=('bat: colored pkgbuild printing' 'devtools: build in chroot and downloading pkgbuilds')
conflicts=('paru')
provides=('paru')
sha256sums_x86_64=('30af90baf308a3aab7497f8d4c898abfaa2ecdb28310c903c470b8026a51a152')
sha256sums_aarch64=('5e62a37971101e18812e7a1345f980a3f9137e2a5ac9b6135d6af9aab32fd3ab')
sha256sums_armv7h=('225b6c235e551929098c5e7cdc915f4d8caa62f4e733c7a11075038b940c6641')

package() {
  cd "$srcdir/"

  install -Dm755 paru "${pkgdir}/usr/bin/paru"
  install -Dm644 paru.conf "${pkgdir}/etc/paru.conf"

  install -Dm644 man/paru.8 "$pkgdir/usr/share/man/man8/paru.8"
  install -Dm644 man/paru.conf.5 "$pkgdir/usr/share/man/man5/paru.conf.5"

  install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/paru.bash"
  install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/paru.fish"
  install -Dm644 completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_paru"

  cp -r locale "$pkgdir/usr/share/"
}
