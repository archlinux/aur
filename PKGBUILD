#Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=nmap-ncc-scripts-git
_pkgname=nmap-nse-vulnerability-scripts
pkgver=r15.0a71040
pkgrel=1
pkgdesc='NMAP Vulnerability Scanning Scripts by NCC Group'
url='https://github.com/nccgroup/nmap-nse-vulnerability-scripts'
arch=('any')
license=('none')
depends=('nmap')
makedepends=('git')
source=("git+https://github.com/nccgroup/nmap-nse-vulnerability-scripts.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm755 "$pkgdir/usr/share/nmap/scripts/ncc"
    cp -a $_pkgname/*.nse "$pkgdir/usr/share/nmap/scripts/ncc"
}
