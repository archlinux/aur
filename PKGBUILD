# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>

pkgname=nvimpager
pkgver=0.10.4
pkgrel=1
pkgdesc="Use nvim as a pager to view manpages, diffs, etc with nvim's syntax highlighting"
arch=('any')
url='https://github.com/lucc/nvimpager'
license=('BSD')
depends=('neovim>=0.4.4' 'bash')
makedepends=('git' 'scdoc')
conflicts=('nvimpager-git')
source=("https://github.com/lucc/nvimpager/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('4b9e3ba525bfc75ed0fe30ae54e5f3a67d6c9c287c082754db7e2ed3d93a329d63ac553341588a769f43f2b1fbc843db93b098e51ad608ec598e8f59348d000b')

package() {
    cd "nvimpager-$pkgver"/

    make PREFIX="/usr" DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/vimpager/LICENSE"
}
