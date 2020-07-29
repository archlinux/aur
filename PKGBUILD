# Maintainer: Nicholas Boyd Isacsson <nicholas@isacsson.se>

pkgname=runin
pkgver=r2.a9636d1
pkgrel=1
pkgdesc='Launch a terminal to run a command, passing on stdin & stdout'
arch=('any')
url="https://github.com/nichobi/${pkgname}"
license=('GPL3')
depends=('bash')
makedepends=('git')
provides=('ronin')
source=(git+$url)
md5sums=(SKIP)

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    install -vDm 755 runin -t "${pkgdir}/usr/bin/"
}

