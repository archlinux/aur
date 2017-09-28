# Maintainer: Hugo Rodrigues <me@hugorodrigues.net>

pkgname="typescript-vim-git"
pkgver=7843f89
pkgrel=1
pkgdesc="Typescript syntax files for Vim"
arch=('any')
url='https://github.com/leafgarland/typescript-vim'
license=('none')
depends=('vim')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}"
    git checkout "${pkgver}"
    for _dir in *; do
        if [ -d "${_dir}" ]; then
            for _file in $(find "${_dir}" -name "*.vim"); do
                install -D -m644 "${_file}" "${pkgdir}"/usr/share/vim/vimfiles/"${_file}"
            done
        fi
    done
}

