# Maintainer: Syed Ali Rizvi <rizvihuihuihui@icloud.com>

pkgname=vimasm
pkgver=1.0.1
pkgrel=1
pkgdesc="Vim-based NASM + DOSBox environment for learning x86 Assembly with debugging (AFD)"
arch=('any')
url="https://github.com/sanecodeguy/vimasm"
license=('MIT')
depends=('nasm' 'dosbox' 'wget' 'unzip' 'neovim')
makedepends=('git')
source=("vimasm.sh"
        "init.lua"
        "dosbox-vimasm.conf"
        "welcome.asm"
        "LICENSE"
        "README.md"
        "AFD.EXE::https://github.com/soothscier/assembly-nasm/raw/master/AFD.EXE")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
  # Launcher
  install -Dm755 "$srcdir/vimasm.sh" "$pkgdir/usr/bin/vimasm"

  # Shared resources
  install -Dm644 "$srcdir/welcome.asm" "$pkgdir/usr/share/vimasm/welcome.asm"
  install -Dm644 "$srcdir/dosbox-vimasm.conf" "$pkgdir/usr/share/vimasm/dosbox-vimasm.conf"
  install -Dm644 "$srcdir/init.lua" "$pkgdir/usr/share/vimasm/init.lua"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  # AFD.EXE debugger
  install -Dm644 "$srcdir/AFD.EXE" "$pkgdir/usr/share/vimasm/AFD.EXE"
}

