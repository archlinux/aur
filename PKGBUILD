# Maintainer: FadeMind <fademind@gmail.com>

pkgname=bumblebeed-resume-git
pkgver=20160528
pkgrel=1
pkgdesc="Simple systemd service for prevent TURN ON NVIDIA GPU after resume"
arch=('any')
url="https://github.com/FadeMind/${pkgname%-git}"
license=('GPL2')
depends=('bash' 'bumblebee' 'coreutils' 'systemd')
makedepends=('git' 'make')
optdepends=("bbswitch: Kernel module allowing to switch dedicated graphics card on Optimus laptops")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')
install="${pkgname%-git}.install"

pkgver() {
    cd ${pkgname%-git}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
    cd ${pkgname%-git}
    make install DESTDIR="$pkgdir"
}
