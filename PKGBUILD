# Maintainer: camb <camb@aur.archlinux.org>

pkgname=vim-emoji-git
pkgver=35.g9ed6515
pkgrel=1
pkgdesc="Emoji in Vim"
arch=('any')
license=('custom:vim')
url="https://github.com/junegunn/${pkgname%-git}"
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    echo "$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    find autoload -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;
}
