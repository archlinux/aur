# Maintainer: 3ED <krzysztofas _at_ protonmail _dot_ com>

pkgname=vim-perl-completion
pkgver=2.42
_srcid=13656
pkgrel=1
pkgdesc='perl omni completion support for basic Moose syntax, variable names (array, hash, ...), class methods, etc.'
arch=('any')
url='https://www.vim.org/scripts/script.php?script_id=2852'
license=('custom:vim')
depends=('perl' 'vim')
source=("$pkgname-$pkgver.zip::http://www.vim.org/scripts/download_script.php?src_id=$_srcid")
sha256sums=('39cbfa8a836b605f10c4763e733f8686ed65f11b4a374284ee9235ae15872d7f')
noextract=("$pkgname-$pkgver.zip")

package() {
	cd "$srcdir"
	_DESTDIR="$pkgdir/usr/share/vim/vimfiles/"

	install -dm755 "$_DESTDIR"

	bsdtar -xf $pkgname-$pkgver.zip \
		--exclude config.mk \
		--exclude Makefile \
		--exclude README.mkd \
		--exclude README.mkd.old \
		--exclude test.vim \
		--directory "$_DESTDIR"
}
