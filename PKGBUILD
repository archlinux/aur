# Maintainer: itzlassejlv <hello@lassejlv.dk>
pkgname=arego
_version=0.1.19
pkgver=${_version//-/_}
pkgrel=1
pkgdesc="Design with HTML and CSS on a native canvas"
arch=('x86_64')
url="https://arego.design"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'fontconfig' 'freetype2' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'wayland' 'vulkan-icd-loader' 'hicolor-icon-theme' 'shared-mime-info' 'desktop-file-utils')
optdepends=('vulkan-driver: GPU rendering (mesa provides one)'
            'wl-clipboard: paste rich content on Wayland'
            'xclip: paste rich content on X11'
            'org.freedesktop.secrets: remember your key (gnome-keyring, kwallet, keepassxc)')
options=('!strip' '!debug')
source=("Arego-$_version-linux-x86_64.tar.gz::https://releases.arego.design/v$_version/Arego-$_version-linux-x86_64.tar.gz")
sha256sums=('ef96add17360535cfc4303bd07453fcf11d423437f9627fd5009f793fb61c449')

package() {
    cd "Arego-$_version-linux-x86_64"
    install -Dm755 bin/arego "$pkgdir/usr/bin/arego"
    cp -r share "$pkgdir/usr/"
    find "$pkgdir/usr/share" -type d -exec chmod 755 {} +
    find "$pkgdir/usr/share" -type f -exec chmod 644 {} +
}
