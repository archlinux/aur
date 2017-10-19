# Maintainer: Richard Neumann <r dot neumann at homeinfo period de>

pkgname=archisomod
pkgver=r39.d669598
pkgrel=2
_reponame='archiso-tools'
pkgdesc='Another tool to remaster Arch Linux live ISOs'
arch=('any')
url="https://github.com/HOMEINFO/${_reponame}"
license=('GPLv3')
depends=('python' 'python-docopt' 'libisoburn')
optdepends=('grub: 32-bit EFI image creation')
makedepends=('git')
source=("git+${url}")
sha512sums=('SKIP')
srcdir='src'
pkgdir='pkg'


pkgver() {
    cd ${_reponame}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    install -d -m 755 "${pkgdir}/usr/bin"
    install -m 755 "${srcdir}/${_reponame}/archisomod" "${pkgdir}/usr/bin/archisomod"
}
