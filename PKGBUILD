# Maintainer: Alexandre Teles (afterSt0rm) <ateles.1@gmail.com>

pkgname=powscript
pkgver=git
pkgrel=1
pkgdesc="Bash dialect transpiler in bash: painless shellscript / indentbased / coffeescript for shellscript / bash for hipsters"
arch=('any')
url="https://github.com/coderofsalvation/powscript"
license=("BSD-2-Clause")
depends=('bash')
makedepends=('git')
provides=('powscript')

sha256sums=('SKIP')

source=(git+https://github.com/coderofsalvation/powscript.git#branch=master)

pkgver() {

    # Get package info from repository

    cat ${pkgname}/package.json | grep version | sed -n 's/.*"version": "\(.*\)",/\1/p'

}

package() {
    mkdir -p ${pkgdir}/usr/local/bin/
    install --backup --compare ./${pkgname}/powscript ${pkgdir}/usr/local/bin/
}
