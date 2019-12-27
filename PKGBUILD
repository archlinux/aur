# Maintainer: Mendel Greenberg <mendel at chabad 360 dot com>
pkgname=argos-uri-installer-git
pkgver=r32.b9139f2
pkgrel=1
pkgdesc="Argos URI handler for bitbar://"
arch=('any')
url="https://github.com/chabad360/argos-installer"
license=('GPL3')
depends=('gnome-shell-extension-argos-git'
         'desktop-file-utils'
	 'bash')
makedepends=('git')
source=('git+https://github.com/chabad360/argos-installer.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/argos-installer"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/argos-installer"
    install -Dm755 "add-argos" "$pkgdir/usr/bin/add-argos"
    install -Dm644 "argos.desktop" "$pkgdir/usr/share/applications/argos.desktop"
}
