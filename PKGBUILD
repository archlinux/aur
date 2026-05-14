# Maintainer: eloudo <https://codeberg.org/eloudo>
# Contributor: litame

pkgname=fortune-mod-leftism-fr-git
_pkgname=leftist-quotes-fr
pkgver=r6.00588cc
pkgrel=1
pkgdesc="Leftist fortune quotes in french"
arch=('any')
url="https://forge.zenify.fr:4430/litame/$_pkgname"
license=('custom:public domain')
makedepends=('git')
depends=('fortune-mod')
groups=('fortune-mods')
source=("git+$url.git")
sha256sums=("SKIP")

pkgver(){
        cd "$srcdir/$_pkgname"
        echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build(){
        cd "${srcdir}/$_pkgname"
        strfile ${_pkgname}
}

package(){
        cd "${srcdir}/$_pkgname"
        install -dm755 -- "${pkgdir}/usr/share/fortune"
        install -m644 -- ${_pkgname} ${_pkgname}.dat "${pkgdir}/usr/share/fortune"
}
