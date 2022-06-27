# Maintainer: Morgan <morganamilo@archlinux.org>
pkgname=paru-bin
pkgver=1.11.0
pkgrel=1
pkgdesc='Feature packed AUR helper'
url='https://github.com/morganamilo/paru'
source_x86_64=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver-x86_64.tar.zst")
source_aarch64=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver-aarch64.tar.zst")
source_armv7h=("https://github.com/Morganamilo/paru/releases/download/v$pkgver/paru-v$pkgver-armv7h.tar.zst")
backup=("etc/paru.conf")
arch=('x86_64' 'aarch64' 'armv7h')
license=('GPL3')
depends=('git' 'pacman')
optdepends=('asp: downloading repo pkgbuilds' 'bat: colored pkgbuild printing' 'devtools: build in chroot')
conflicts=('paru')
provides=('paru')
sha256sums_x86_64=('2ad85e58a42bbb6a05ae2b971e9636b1617b0459768f53b25cc60dd40bab8036')
sha256sums_aarch64=('cd3c547f53f202113d57e19d43fc83b974581e0a3a9aed6a29f471690a6e2f55')
sha256sums_armv7h=('286b8bc3678357f87eb2a9dd0590e84d1daffbb6584fb7b58ff315af7e399b8b')

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
