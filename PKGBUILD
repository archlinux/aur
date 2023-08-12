# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=zsh-autocomplete
pkgver=r89.c335940
pkgrel=1
pkgdesc='IDE-style type-ahead completion for Zsh'
arch=('any')
url='https://github.com/marlonrichert/zsh-autocomplete'
license=('MIT')
depends=('zsh')
makedepends=('git')
source=("git+$url.git")
sha512sums=('SKIP')
provides=("$pkgname")

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    _srcdir=${srcdir}/${pkgname}
    _plugindir=${pkgdir}/usr/share/zsh/plugins
    _licdir=${pkgdir}/usr/share/licenses/${pkgname}

    install -dm0755 ${_plugindir}/${pkgname}
    cp -r ${_srcdir}/zsh-autocomplete.plugin.zsh ${_plugindir}/${pkgname}
    cp -r ${_srcdir}/zsh-autocomplete.zsh ${_plugindir}/${pkgname}

    install -dm755 ${_licdir}
    install -m0644 ${_srcdir}/LICENSE ${_licdir}
}
