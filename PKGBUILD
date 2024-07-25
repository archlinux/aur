# Maintainer: Emma Caldeira <kiito@tilde.team>

pkgname='vim-mako-git'
provides=('vim-mako')
pkgver=r28.09d2a93
pkgrel=1
pkgdesc='Vim highlighting for the mako templating language'
arch=('any')
url='https://github.com/sophacles/vim-bundle-mako'
license=('custom:vim')
depends=('vim')
makedepends=('git')
source=('git+https://github.com/sophacles/vim-bundle-mako.git')
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/vim-bundle-mako"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/vim-bundle-mako"
    local installpath="$pkgdir/usr/share/vim/vimfiles"
	install -Dm755 ftdetect/mako.vim "$installpath"/ftdetect/mako.vim
	install -Dm755 ftplugin/mako.vim "$installpath"/ftplugin/mako.vim
	install -Dm755 indent/mako.vim "$installpath"/indent/mako.vim
	install -Dm755 syntax/mako.vim "$installpath"/syntax/mako.vim
}
