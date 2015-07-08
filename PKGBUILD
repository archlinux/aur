# Maintainer: Eli Schwartz <eschwartz93@gmail.com>

pkgname=vim-eunuch
pkgver=1.1
pkgrel=2
pkgdesc="Vim sugar for the UNIX shell commands that need it the most, by tpope"
arch=('any')
url="https://github.com/tpope/${pkgname}"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
install=vimdoc.install
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e452ddd541ef10e5fa9af48e36b181df6d95e5fe96fcea56cf41b20f99db8532')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -dm755 "${pkgdir}/usr/share/vim/vimfiles"
    find * -maxdepth 0 -type d -exec cp -rt "${pkgdir}/usr/share/vim/vimfiles" '{}' \+
}
