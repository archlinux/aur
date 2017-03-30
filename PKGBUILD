# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Vincenzo Maffione <v.maffione@gmail.com>
pkgname=qrun-git
pkgver=r37.d5418be
pkgrel=1
pkgdesc="A command line tool to run QEMU in the most common configurations"
arch=('any')
license=('GPL')
depends=('python' 'qemu' 'bridge-utils' 'iproute2')
makedepends=('git')
source=('git+https://github.com/vmaffione/qrun')
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${pkgname%-git}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    # Install the script into /usr/bin
    mkdir -p "$pkgdir/usr/bin"
    install "$srcdir/${pkgname%-git}/qrun.py" "$pkgdir/usr/bin/qrun"
}

# vim:set ts=2 sw=2 et:
