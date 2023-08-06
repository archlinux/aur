# Maintainer: Liao Junxuan <mikeljx at 126 dot com>
_pkgname=vim-wayland-clipboard
pkgname=$_pkgname-git
provides=($_pkgname)
conflicts=($_pkgname)
pkgver=r22.9b6def0
pkgrel=1
pkgdesc="Integrate Vim's '+' register with the Wayland system clipboard"
arch=('any')
url="https://github.com/jasonccox/vim-wayland-clipboard"
license=('MIT')
depends=('vim-plugin-runtime')
makedepends=('git')
source=("git+$url#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"

    local _installpath="${pkgdir}/usr/share/vim/vimfiles"
    install -d "${_installpath}"
    find plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
