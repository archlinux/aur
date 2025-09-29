# Maintainer: Syed Ali Rizvi <rizvihuihuihui@icloud.com>
pkgname=vimasm
pkgver=1.0.1
pkgrel=1
pkgdesc="Vim-based NASM + DOSBox environment for learning x86 Assembly with debugging (AFD)"
arch=('any')
url="https://github.com/sanecodeguy/vimasm"
license=('MIT')
depends=('nasm' 'dosbox' 'neovim' 'wget' 'unzip')
makedepends=('git')
source=("vimasm.sh"
        "init.lua"
        "dosbox-vimasm.conf"
        "welcome.asm"
        "LICENSE"
        "README.md"
        "AFD.EXE::https://github.com/soothscier/assembly-nasm/raw/master/AFD.EXE")
sha256sums=('9e38ebd5340607e3de3edf695ac5a3b3d07b91d7565de16e52bcc9ca3545d264'
            '0cd8a3c983a5ee4916e0a4f8e419005f0ff7a80abf2f02bc57765671fa8d2171'
            '33e03ed100d4e04f167ce3956090d5c902144ed10076da7954172afa4615c766'
            '55f804251d6bd475e46bfd77396d7c9e934b4eadd940114ffe0ccad0aa0317c6'
            '19c1bac237060f0bbc183786568c53f662be208959d54e104b3c74e0177e63f2'
            '801fb8863e3c1c382d1418e6e3376055aeb3d7613c0671c9fd50bb4064accf5a'
            'c1b1b450405a6f2ac9cfa7d29f89415e87439cfdeac95c4118f3f92ed6395fa0')

package() {
    # Launcher
    install -Dm755 "$srcdir/vimasm.sh" "$pkgdir/usr/bin/vimasm"

    # Shared resources
    install -Dm644 "$srcdir/welcome.asm" "$pkgdir/usr/share/vimasm/welcome.asm"
    install -Dm644 "$srcdir/dosbox-vimasm.conf" "$pkgdir/usr/share/vimasm/dosbox-vimasm.conf"
    install -Dm644 "$srcdir/init.lua" "$pkgdir/usr/share/vimasm/init.lua"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/AFD.EXE" "$pkgdir/usr/share/vimasm/AFD.EXE"
}

