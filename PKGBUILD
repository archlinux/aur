# Maintainer: Pascal Mehnert <gargoil@posteo.de>

pkgname=nvimpager-git
pkgver=0.10.2.r8.g499f43c
pkgrel=1
pkgdesc="Use nvim as a pager to view manpages, diffs, etc with nvim's syntax highlighting"
arch=('any')
url='https://github.com/lucc/nvimpager'
license=('BSD')
depends=('neovim>=0.4.0' 'bash')
makedepends=('git' 'scdoc')
conflicts=('nvimpager')
provides=('nvimpager')
source=('git+https://github.com/lucc/nvimpager.git')
sha256sums=('SKIP')

pkgver() {
    cd nvimpager/
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    cd nvimpager/

    make PREFIX="/usr" DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/vimpager/LICENSE"
}
