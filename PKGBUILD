# Maintainer: Akita Noek <akita@noek.net>

pkgname=sandbox-bin
pkgver=0.3.0
pkgrel=1
arch=('x86_64')
pkgdesc='A tool for creating lightweight containerized copy-on-write views of your computer for safely running programs and managing output.'
url='https://github.com/anoek/sandbox'
license=('MIT')
depends=()
install="$pkgname.install"
source=("LICENSE::https://github.com/anoek/sandbox/raw/main/LICENSE"
        "sandbox-bin.tar.zst::https://github.com/anoek/sandbox/releases/download/0.3.0/sandbox-bin-0.3.0-1-x86_64.pkg.tar.zst"
        )
sha256sums=('c73b19352a4ce2884771b8b16ecb562dd755a23ed1e73fb44c2271e90b4af8e5'
            '91edc38f20ac3da8145bed1e51027adb2ade9cf63782e1e4253a1553773eb2e3')

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man1"
  mkdir -p "$pkgdir/usr/share/zsh/site-functions"
  mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
  mkdir -p "$pkgdir/usr/share/bash-completion/completions"

  install -m0755 usr/bin/sandbox "$pkgdir/usr/bin/sandbox"
  install -m644 usr/share/man/man1/sandbox.1.gz "$pkgdir/usr/share/man/man1/sandbox.1.gz"
  install -m644 usr/share/zsh/site-functions/_sandbox "$pkgdir/usr/share/zsh/site-functions/_sandbox"
  install -m644 usr/share/bash-completion/completions/sandbox "$pkgdir/usr/share/bash-completion/completions/sandbox"
  install -m644 usr/share/fish/vendor_completions.d/sandbox.fish "$pkgdir/usr/share/fish/vendor_completions.d/sandbox.fish"

  install -D -m644  LICENSE "$pkgdir/usr/share/licenses/sandbox-bin/LICENSE"
}
