# Maintainer: Richard Neumann <r dot neumann at homeinfo period de>

pkgname=archisomod
pkgver=r39.d669598
pkgrel=1
pkgdesc='Another tool to remaster Arch Linux live ISOs'
arch=('any')
url='https://github.com/HOMEINFO/archiso-tools'
license=('GPLv3')
depends=('python')
optdepends=('python-docopt: command line interface')
makedepends=('python' 'git')
source=("git+${url}")
sha512sums=('SKIP')
srcdir='src'
pkgdir='pkg'
_reponame='archiso-tools'


pkgver() {
    cd ${_reponame}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    install -d -m 755 "${pkgdir}/usr/bin"
    install -m 755 "${srcdir}/${_reponame}/archisomod" "${pkgdir}/usr/bin/archisomod"
}
