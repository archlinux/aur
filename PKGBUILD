# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>

pkgname=nvimpager
pkgver=0.13.0
pkgrel=1
pkgdesc="Use nvim as a pager to view manpages, diffs, etc with nvim's syntax highlighting"
arch=('any')
url='https://github.com/lucc/nvimpager'
license=('BSD')
depends=('neovim>=0.4.4' 'bash')
makedepends=('git' 'scdoc')
conflicts=('nvimpager-git')
source=("https://github.com/lucc/nvimpager/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d8e00975517423c4fa4a154c1091ba8c7eb5d62b1d4fb6d8ec5722120d84489b858ebcbab0699b149330d7422fee27cb73969f0c06ba10ad01d5085a4178cd05')

package() {
    cd "nvimpager-$pkgver"/

    make PREFIX="/usr" DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/vimpager/LICENSE"
}
