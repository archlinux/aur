# Maintainer: justanoobcoder <syaorancode@gmail.com>

_github_user="hainguyents13"
_github_repo="mechvibes"

pkgname=mechvibes
pkgver=2.3.6
pkgrel=1
pkgdesc="Play mechanical keyboard sounds as you type."
arch=('x86_64')
url="https://mechvibes.com"
license=('MIT')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'dbus' 'desktop-file-utils' 'expat' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libcups' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'pango' 'util-linux-libs' 'xdg-utils')
options=('!strip' '!emptydirs')
install=${pkgname}.install
#source=("https://github.com/${_github_user}/${_github_repo}/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
source=("https://github.com/${_github_user}/${_github_repo}/releases/download/v${pkgver}/${pkgname}_${pkgver}_hotfix_amd64.deb")
md5sums=('015bc37bffc02b1d5d72ff337962de39')

package() {

    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"
    # Install Icon
    for i in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "$pkgdir"/usr/share/icons/hicolor/0x0/apps/"$pkgname".png \
            "$pkgdir"/usr/share/icons/hicolor/"$i"/apps/"$pkgname".png
    done
}
