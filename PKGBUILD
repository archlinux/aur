pkgname=fenriz-desktop-bin
pkgver=0.1.11
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
sha256sums=('b9727a3d9670cdb5408bf0c0909769a62b3451bef02f4ec97227363b72282db7')

package() {
    cd "fenriz-desktop-${pkgver}"

    cp -dr --no-preserve=ownership usr etc "$pkgdir/"
}
