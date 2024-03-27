# Maintainer: ACCESA <accesa.mdash@gmail.com>
pkgname=cia-accesa
pkgver=1.8.1
pkgrel=1
pkgdesc="Control Inteligente de Accesos"
arch=('x86_64')
url="https://accesa.me"
license=('GPL')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'desktop-file-utils' 'discord' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'gvfs' 'hicolor-icon-theme' 'intel-oneapi-basekit' 'kde-cli-tools' 'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'trash-cli' 'xdg-utils')
optdepends=('gir1.2-gnomekeyring-1.0: Description of optional feature'
            'libgnome-keyring: Another optional feature'
            'lsb-release: Yet another optional feature'
            'pulseaudio: Optional feature for sound support')
source=("cia-1.8.1-1-x86_64.pkg.tar.zst::https://www.dropbox.com/scl/fi/1f36wsbx31mudslfqz8j7/cia-1.8.1-1-x86_64.pkg.tar.zst?rlkey=gxrmtdi5r4l9v5w02p980k5hj&dl=0")
md5sums=('SKIP')

package(){
    mkdir -p $pkgdir/usr/share/applications
    cp -r usr $pkgdir
}

post_install() {
    gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
    update-desktop-database -q
}

post_upgrade() {
    post_install
}

post_remove() {
    gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
    update-desktop-database -q
}
