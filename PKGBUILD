# Maintainer: Richard Neumann <r dot neumann at homeinfo period de>

pkgname=archisomod-git
pkgver=r82.64841ce
pkgrel=1
_reponame='archiso-tools'
pkgdesc='Another tool to remaster Arch Linux live ISOs'
arch=('any')
url="https://gitlab.com/HOMEINFO/${_reponame}"
license=('GPLv3')
depends=('python' 'coreutils' 'libisoburn' 'squashfs-tools')
optdepends=(
    'grub: Standalone EFI image creation'
    'dosfstools: Standalone EFI image creation'
)
makedepends=('git')
source=("git+${url}")
sha512sums=('SKIP')


pkgver() {
    cd ${_reponame}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    install -d -m 755 "${pkgdir}/usr/bin"
    install -m 755 "${srcdir}/${_reponame}/archisomod" "${pkgdir}/usr/bin/archisomod"
}
