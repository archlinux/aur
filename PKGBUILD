# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
# Thx to the vim-syntastic package maintainer/contributors

pkgname=vim-extline
pkgver=0.2
pkgrel=1
pkgdesc='Vim plugin for extending lines (e.g., underlined titles)'
arch=('any') 
url='https://github.com/drmikehenry/vim-extline'
license=('vim-license')
depends=('vim')
groups=('vim-plugins')
install="vimdoc.install"
source=("https://github.com/shibumi/vim-extline/archive/0.2.tar.gz")
sha512sums=('5b6ef69ed6c293302beae26eefa6aebb2c9893816e0d7d1baad13c96b1631e7efdb4637826b339b2ba594803857c77d8007df251655850d1f1afa124751ef7ff')

package() {

    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d "${pkgdir}/usr/share/vim/vimfiles/"{plugin,doc,autoload}
    find . -type d -exec chmod 755 '{}' \;
    cp -dr plugin/* "$pkgdir/usr/share/vim/vimfiles/plugin/"
    install -Dm0644 doc/extline.txt "${pkgdir}/usr/share/vim/vimfiles/doc/extline.txt"
    cp -r autoload/extline.vim "$pkgdir/usr/share/vim/vimfiles/autoload/"
}

