# Maintainer: Morgan <morganamilo@archlinux.org>
pkgname=paru-bin
pkgver=1.11.2
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
sha256sums_x86_64=('8cb2faa8098f259c5faffe2c3e94cdc4f0d4dc1a59921b818f1ec0fc50deb278')
sha256sums_aarch64=('ff9272600e5e0b4e380ced5376a2c2ee480f34e84456235dec785c63378ec804')
sha256sums_armv7h=('c73b0f4dcba0dd45c222c6a00a923c7811be29a1ff1ab8972bac2c0b569e5968')

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
