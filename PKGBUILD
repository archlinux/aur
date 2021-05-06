# Maintainer : Yamada Hayao <development@fascode.net>

_pkgname=just
_reponame="${_pkgname}-js"
pkgname="${_reponame}"
pkgver="0.0.22"
pkgrel="1"
pkgdesc='a very small v8 javascript runtime for linux only'
arch=('x86_64' "i686")
url='https://github.com/just-js/just'
source=("https://github.com/${_reponame}/${_pkgname}/archive/refs/tags/${pkgver}.zip")
md5sums=('SKIP')
dirname="${_pkgname}-${pkgver}"

build(){
    cd "${srcdir}/${dirname}"
    make runtime-static
}

package() {
    cd "${srcdir}/${dirname}"
    make INSTALL="${pkgdir}/usr/bin/" install
}
