# Maintainer: Pratik Pingale <pratikbpingale9075@gmail.com>
pkgname=boo-grub-git
pkgver=r2.e86aca3
pkgrel=2
pkgdesc="A dark grub2 bootloader theme theme based on Dracula grub"
arch=('any')
url="https://github.com/PROxZIMA/boo-grub"
license=('MIT')
depends=('grub')
makedepends=()
provides=("${pkgname}")
conflicts=()
source=('git+https://github.com/PROxZIMA/boo-grub.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/boo-grub"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/boo-grub"
    mkdir -p "${pkgdir}/usr/share/grub/themes/"
    cp -r boo "${pkgdir}/usr/share/grub/themes/"
}
