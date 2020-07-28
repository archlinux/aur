# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-selenized-git
_pkgname=vim-selenized
pkgver=v1.0.r13.ge93e0d9
pkgrel=1
arch=('any')
url='https://github.com/jan-warchol/selenized'
license=('')
makedepends=('git')
pkgdesc="Solarized redesigned: fine-tuned color palette for programmers with focus on readability."
depends=('vim')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}/editors/vim"
    find colors -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;
}
