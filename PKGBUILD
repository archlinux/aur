# Maintainer: Eric Fung <loseurmarbles [at] gmail [dot] com>
# Contributor: Jeremy Audet <jerebear [at] protonmail [dot] com>
# Contributor: Mike Redd <mredd -at- 0 tue 0 dot com>

pkgname=vim-badwolf-git
pkgver=1.6.0.r14.g682b521
pkgrel=1
pkgdesc='A color scheme for Vim, pieced together by Steve Losh.'
arch=('any')
url='http://stevelosh.com/projects/badwolf/'
license=('MIT')
groups=('vim-plugins')
depends=('vim')
makedepends=('git')
source=("${pkgname}::git+https://github.com/sjl/badwolf.git")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -Dm644 "${srcdir}/${pkgname}/colors/badwolf.vim" \
                   "${pkgdir}/usr/share/vim/vimfiles/colors/badwolf.vim"
    install -Dm644 "${srcdir}/${pkgname}/colors/goodwolf.vim" \
                   "${pkgdir}/usr/share/vim/vimfiles/colors/goodwolf.vim"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE.markdown" \
                   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
