# Maintainer: Anakojm <https://anakojm.net/about.html>

pkgname=fortune-mod-leftism-git
_pkgname=leftist-quote
pkgver=r26.c1d4dda
pkgrel=1
pkgdesc="Leftist fortune quotes"
arch=('any')
url="https://github.com/anakojm/$_pkgname"
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
        strfile ${_pkgname}s
}

package(){
        cd "${srcdir}/$_pkgname"
        install -dm755 -- "${pkgdir}/usr/share/fortune"
        install -m644 -- ${_pkgname}s ${_pkgname}s.dat "${pkgdir}/usr/share/fortune"
}
