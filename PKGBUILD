# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=vim-detectspelllang
_pkgname="${pkgname%vim-}"
pkgver=2.2
pkgrel=1
pkgdesc="Make Vim autodetect the spellcheck language"
arch=(any)
url="https://github.com/Konfekt/${pkgname}"
license=(unknown)
depends=(vim-plugin-runtime)
groups=(vim-plugins)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/vim-DetectSpellLang-${pkgver}"  # Case matters!
    _installpath="${pkgdir}/usr/share/vim/vimfiles"

    for file in autoload/*.vim doc/*.txt plugin/*.vim; do
        install -Dm644 "$file" "${_installpath}/${file}"
    done
}
