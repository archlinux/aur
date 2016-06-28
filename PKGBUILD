# Maintainer: HE Chong <chong.he.1989@gmail.com>
pkgname=nvim-thesaurus_query
pkgver=0.4.0
pkgrel=1
pkgdesc="Multi-language Thesaurus Query and Replacement plugin for neovim"
arch=('any')
url="https://github.com/Ron89/thesaurus_query.vim"
license=('Apache License, Version 2.0')
groups=('neovim-plugins')
depends=('neovim' 'python' 'python2>=2.7.0')
makedepends=('')
install='thesaurus-query.install'
conflicts=('')
replaces=('')
provides=('')
validpgpkeys=()

_source_name='thesaurus_query.vim'
_source="https://$_gitdomain/$_gituser/$_gitname.git/"
source=("${_source_name}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('29f0b2bd28933e519900a2c4e9d91765fd006023cfa39934a1b23108bc9d21f71986d35bcd9540d0d1853a9171399b862bf7daa6946875bb06ba6ee9f76ccc73')
_nvim_runtime='/usr/share/nvim/runtime/'

package() {
    install -d ${pkgdir}${_nvim_runtime}{autoload,autoload/thesaurus_query,plugin,syntax,doc}
    install -D -m644 ${srcdir}/${_source_name}-${pkgver}/autoload/thesaurus_query.vim \
        "${pkgdir}${_nvim_runtime}autoload/"
    install -D -m644 ${srcdir}/${_source_name}-${pkgver}/autoload/thesaurus_query/* \
        "${pkgdir}${_nvim_runtime}autoload/thesaurus_query/"
    install -D -m644 ${srcdir}/${_source_name}-${pkgver}/plugin/thesaurus_query.vim \
        "${pkgdir}${_nvim_runtime}plugin/"
    install -D -m644 ${srcdir}/${_source_name}-${pkgver}/syntax/* \
        "${pkgdir}${_nvim_runtime}syntax/"
    install -D -m644 ${srcdir}/${_source_name}-${pkgver}/doc/* \
        "${pkgdir}${_nvim_runtime}doc/"
}
