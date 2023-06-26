# Maintainer: Darius Niminenn <root at dnim dot dev>

pkgname=zsh-ansimotd-git
_pkgname=zsh-ansimotd
pkgver=r29.2d1e85c
pkgrel=1
pkgdesc="Zsh plugin for displaying colorful ansi MOTD"
arch=('any')
url="https://github.com/yuhonas/zsh-ansimotd"
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
