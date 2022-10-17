# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>

pkgname=nvimpager
pkgver=0.11.0
pkgrel=1
pkgdesc="Use nvim as a pager to view manpages, diffs, etc with nvim's syntax highlighting"
arch=('any')
url='https://github.com/lucc/nvimpager'
license=('BSD')
depends=('neovim>=0.4.4' 'bash')
makedepends=('git' 'scdoc')
conflicts=('nvimpager-git')
source=("https://github.com/lucc/nvimpager/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('108d9df1dd9c47ff3f62ed08665c7fd2b18bf50d99544cd629148d34c7918026e35b26b761a82e069c76192f9014c9800381982ecfe5c7129a8cf0d4b6c124b8')

package() {
    cd "nvimpager-$pkgver"/

    make PREFIX="/usr" DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/vimpager/LICENSE"
}
