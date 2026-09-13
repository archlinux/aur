pkgname=fenriz-desktop-bin
pkgver=0.1.15
pkgrel=1
pkgdesc="Desktop shell for Wayland compositors (Binary Release)"
arch=('x86_64')
url="https://github.com/zackb/fenriz"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'glib2' 'wayland' 'polkit' 'wireplumber' 'pam')
optdepends=('fenriz: the compositor this shell is built for'
            'fprintd: fingerprint unlock, see /usr/share/fenriz-desktop/pam'
            'xdg-desktop-portal: file chooser for the wallpaper picker')
provides=('fenriz-desktop')
conflicts=('fenriz-desktop' 'fenriz-desktop-git')
backup=('etc/pam.d/fenriz-desktop')
source=("${url}/releases/download/v${pkgver}/fenriz-desktop-${pkgver}.tar.gz")
sha256sums=('1800c906583376afecf9b0ad71db01ea4fac50c8ad4b00dade24da8994d36b0d')

package() {
    cd "fenriz-desktop-${pkgver}"

    cp -dr --no-preserve=ownership usr etc "$pkgdir/"
}
