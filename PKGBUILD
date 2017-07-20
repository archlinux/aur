# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

# All my PKGBUILDs are managed at https://github.com/eli-schwartz/pkgbuilds

pkgname=vim-endwise-git
pkgver=1.2.r28.gd565526
pkgrel=1
pkgdesc='Wisely add "end" in ruby, endfunction/endif/more in vim script, etc'
arch=('any')
url="https://github.com/tpope/${pkgname%-git}"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -dm755 "${pkgdir}/usr/share/vim/vimfiles"
    find * -maxdepth 0 -type d -exec cp -rt "${pkgdir}/usr/share/vim/vimfiles" '{}' \+
}
