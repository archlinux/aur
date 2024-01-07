# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=vim-msp
pkgver=1.1
pkgrel=1
pkgdesc="assembly language syntax highlighting for the TI MSP430 family of processors"
arch=(any)
url="https://www.vim.org/scripts/script.php?script_id=707"
license=(none)
groups=(vim-plugins)
depends=(
	vim-plugin-runtime
)
source=(
	"msp_orig.vim::https://www.vim.org/scripts/download_script.php?src_id=2212"
	match.patch
	comment.patch
)
sha512sums=('f900c6079f8694b1e91369168c3716a52b3370234c263e92185f7becc4b8a9890963eb5e253b9c2e53822db4f6693717173cef08ee96c5c1ec59046976a1db99'
            '3ffdeca7a011570eddb30bbc286268a1722834e4e5331ed95b6cbfff1ffb872df479b4ff4847e4a21c2b5f49c93e6fc4e7199d1979b9c4121491d7f36ba4dff7'
            '1af8f45b6736eeefab6a5bd70e9d0e259b122d473460d96456a22459a2559f5c729a8bb0c3796345be56ae77dba938e42741caedc519c8add4d1e2cffa78eabc')

prepare() {
	cp msp_orig.vim msp.vim
	dos2unix msp.vim
	patch -p1 -i "match.patch"
	patch -p1 -i "comment.patch"
}

package() {
	install -Dt "$pkgdir/usr/share/vim/vimfiles/syntax/" -m644 msp.vim
}
