# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>

pkgname=nvimpager
pkgver=0.12.0
pkgrel=1
pkgdesc="Use nvim as a pager to view manpages, diffs, etc with nvim's syntax highlighting"
arch=('any')
url='https://github.com/lucc/nvimpager'
license=('BSD')
depends=('neovim>=0.4.4' 'bash')
makedepends=('git' 'scdoc')
conflicts=('nvimpager-git')
source=("https://github.com/lucc/nvimpager/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('38aed8ff4eea7909a35d9b996d61bf613675e50c56a3b6059c432e3e56cd15b40d5661b3b23a529c2824a6b363019ed4904693a63946ca659867127b20387764')

package() {
    cd "nvimpager-$pkgver"/

    make PREFIX="/usr" DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/vimpager/LICENSE"
}
