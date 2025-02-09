# Maintainer: you-oopsdev <itachi522ru@gmail.com>
# Thanks to thestinger and Almageste for the PKGBUILD sample
_scriptid=21998
pkgname=vim-openvpn
pkgver=1.11
pkgrel=2
groups=('vim-plugins' 'neovim-plugins')
pkgdesc="OpenVPN configuration syntax highlighter"
arch=('any')
url='https://www.vim.org/scripts/script.php?script_id=1420'
license=('Unknown')
#depends=('vim' 'neovim')
optdepends=('vim: vim support'
            'neovim: neovim support')
source=("openvpn.tar.bz2::https://www.vim.org/scripts/download_script.php?src_id=$_scriptid"
        "openvpn.ft")

sha256sums=('484f5a338a4c81662a48fd2329a94e3bda10045bcb9f4ae53fbd45f69a8eff53'
            'b99200fa35a2137477ade40a140f54af314aede50014829a832249bc0d6fd972')

package() {
  install -dm 755 "$pkgdir/usr/share/vim/vimfiles/syntax" \
                  "$pkgdir/usr/share/vim/vimfiles/ftdetect"
# Neovim can load plugin directory vim's
  install -Dm 644 "$srcdir/syntax/openvpn.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/"
  install -Dm 644 "$srcdir/openvpn.ft" "$pkgdir/usr/share/vim/vimfiles/ftdetect/openvpn.vim"
}
