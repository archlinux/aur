# Maintainer: Mohammadreza Abdollahzadeh < morealaz at gmail dot com >
pkgname=gnome-shell-extension-focus-indicator-git
pkgver=r34.7256444
pkgrel=1
pkgdesc="An Extension for GNOME Shell for indicating window focus (Github version)."
arch=('any')
url="https://github.com/Leleat/focus-indicator-prototype"
license=('GPL2')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=('gnome-shell')
makedepends=('git')
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    ./build.sh
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -d "${pkgdir}/usr/share/gnome-shell/extensions/indicate-focus@leleat-on-github"
    bsdtar -xf "indicate-focus@leleat-on-github.shell-extension.zip" \
        -C "${pkgdir}/usr/share/gnome-shell/extensions/indicate-focus@leleat-on-github"
}
# vim:set ts=4 sw=4 et:
