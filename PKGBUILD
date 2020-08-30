# Maintainer: crian <crian84 at gmail dot com>

pkgname=zsh-autocomplete-git
_pkgname=zsh-autocomplete
pkgver=r129.93d93c6
pkgrel=1
pkgdesc='IDE-style type-ahead completion for Zsh'
arch=('any')
url='https://github.com/marlonrichert/zsh-autocomplete'
license=('MIT')
depends=('zsh')
makedepends=('git')
source=("git+$url.git")
sha512sums=('SKIP')
provides=("$_pkgname")

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    _srcdir=${srcdir}/${_pkgname}
    _plugindir=${pkgdir}/usr/share/zsh/plugins
    _licdir=${pkgdir}/usr/share/licenses/${_pkgname}

    install -dm0755 ${_plugindir}
    cp -r ${_srcdir} ${_plugindir}

    install -dm755 ${_licdir}
    install -m0644 ${_srcdir}/LICENSE ${_licdir}
}
