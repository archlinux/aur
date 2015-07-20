# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
# Thx to the vim-syntastic package maintainer/contributors

pkgname=vim-table-mode
pkgver=4.6.0
pkgrel=1
pkgdesc='VIM Table Mode for instant table creation. '
arch=('any')
url='https://github.com/dhruvasagar/vim-table-mode'
license=('vim-license')
depends=('vim')
groups=('vim-plugins')
install="vimdoc.install"
source=("https://github.com/dhruvasagar/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('83066d71f6cbe8d8c762fe6c29b2a813fe4e145cc9ca692682cfd7bc0ed2565b316e2dc7f5f1546dc497f0d8c7796e7b6bfa76ebb527797ab450df1309ce3d4a')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d "${pkgdir}/usr/share/vim/vimfiles/"{plugin,doc,autoload/tablemode}
    find . -type d -exec chmod 755 '{}' \;
    cp -dr plugin/* "$pkgdir/usr/share/vim/vimfiles/plugin/"
    install -Dm0644 doc/table-mode.txt "${pkgdir}/usr/share/vim/vimfiles/doc/table-mode.txt"
    cp -r autoload/tablemode/* "$pkgdir/usr/share/vim/vimfiles/autoload/tablemode/"
    cp autoload/tablemode.vim "$pkgdir/usr/share/vim/vimfiles/autoload/"
}

