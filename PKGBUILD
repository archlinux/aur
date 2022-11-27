# Maintainer: Eugene Lopatkin <eugenelopatkin@gmail.com>
pkgname="linked-helper"
pkgver="2"
pkgrel=1
pkgdesc="LinkedIn lead generation tool businesses use to find clients"
arch=("any")
url="https://www.linkedhelper.com/"
license=("unknown")
depends=("gtk3" "lib32-gtk3" "libnotify" "nss" "libxtst" "lib32-libxtst" "xdg-utils" "at-spi2-core" "lib32-at-spi2-core" "libdrm" "lib32-libdrm" "mesa" "lib32-mesa" "libxcb" "lib32-libxcb")
optdepends=("kde-cli-tools" "kdepim-runtime" "trash-cli" "glib2" "gvfs" "pulseaudio" "alsa-lib" "gnome-keyring" "lsb-release")
source=("https://do0ca1hx6twig.cloudfront.net/linked-helper/444657160c922f6b8048468fef840020/latest/linux/x64/linked-helper.deb")
noextract=("linked-helper.deb")
sha512sums=('SKIP')

package() {
    bsdtar -O -xf linked-helper.deb data.tar.xz | bsdtar -C "$pkgdir" -xJf -
    find "${pkgdir}" -type d -exec chmod 755 {} +

    rm -rf "${pkgdir}/usr/share/lintian"
    rm -rf "${pkgdir}/usr/share/doc"
}
