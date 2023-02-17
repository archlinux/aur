# Maintainer: Tomasz Buczyński <tomasz.buczynski@student.uj.edu.pl>

pkgname=box-installer
pkgver=1.0
pkgrel=2
pkgdesc="A utility to install and run packages in chroot environments"
arch=(x86_64 i686 i486 pentium4 arm armv6h armv7h aarch64)
url="https://gitlab.com/tomekb234/box-installer"
license=("MIT")
depends=("pacman")
optdepends=("git: downloading from AUR")
makedepends=(git)
source=("git+https://gitlab.com/tomekb234/box-installer.git#tag=v${pkgver}")
sha256sums=("SKIP")

build() {
    cd box-installer
    make
}

package() {
    cd box-installer
    make DESTDIR="$pkgdir" install
    install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
