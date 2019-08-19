# Maintainer: Mendel Greenberg <chabad 360 at gmail dot com>
pkgname=argos-uri-installer-git
pkgver=r30.b9c3898
pkgrel=1
pkgdesc="Argos URI handler for bitbar://"
arch=('any')
url="https://github.com/chabad360/argos-installer"
depends=('gnome-shell-extension-argos-git')
makedepends=('git')
source=('git+https://github.com/chabad360/argos-installer.git')
md5sums=('SKIP')

prepare() {
    cd argos-installer
    printf '0+%s+g%s' $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

package() {
    cd "${srcdir}/argos-installer"
    install -Dm755 "add-argos" "${pkgdir}/usr/bin/add-argos"
    install -Dm644 "argos.desktop" "${pkgdir}/usr/share/applications/argos.desktop"
}