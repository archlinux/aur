# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>
_pkgname=super_unko
pkgname="${_pkgname}"
pkgver="1.0.5"
pkgrel=1
pkgdesc="Super Unko project is the one of the awesome, clean and sophisticated OSS project in the world."
arch=('i686' 'x86_64')
url="https://github.com/unkontributors/super_unko"
license=('custom:unko')
makedepends=(git)
optdepends=('toilet: for unko.toilet'
            'xterm: for unko.puzzle'
            'xdotool: for unko.puzzle'
            'bc: for unko.puzzle'
            'cowsay: for unko.think')
provides=(super_unko)
#source=("${_pkgname}::git+https://github.com/unkontributors/super_unko.git#branch=oshiri#tag=${pkgver}")
source=("https://github.com/unkontributors/super_unko/archive/refs/tags/${pkgver}.zip")
sha1sums=('SKIP')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    "${srcdir}/${_pkgname}-${pkgver}/install.sh" "${pkgdir}/usr"
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
