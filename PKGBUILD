# Maintainer: eugene hwang <hwang dot eug at gmail dot com>

pkgname=gister-git
_pkgname=gister
pkgver=2.4.0.r0.gba6561e
pkgrel=1
pkgdesc="A command line tool for managing GitHub gists"
arch=('any')
url="https://github.com/weakish/gister"
license=('Apache 2.0')
depends=('curl' 'git' 'gist' 'jq' 'ruby' 'xclip')
optdepends=('legit-git: more streamlined syncing of gist repository'
            'codesearch-git: faster searching of gists')
provides=('gister')
conflicts=('gister')
source=("$_pkgname::git://github.com/weakish/gister.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
}

