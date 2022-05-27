# Maintainer: chaozhi_l <chaozhi_l@foxmail.com>
# Contributor: BigE <eric.gach@gmail.com>

pkgname=gnome-shell-extension-desk-changer
pkgver=34
pkgrel=1
pkgdesc="DeskChanger is a gnome-shell wallpaper slideshow extension with multiple profile support. The extension allows you to switch profiles on the fly without reloading the daemon."
arch=('any')
url="https://github.com/BigE/desk-changer/"
license=('MIT')
depends=('gnome-shell>=3.42' 'gjs')
source=("https://github.com/BigE/desk-changer/archive/refs/tags/version-${pkgver}.tar.gz")


_pkgname=desk-changer

build() {
  cd  ${_pkgname}-version-${pkgver}
  make all
}

package() {

_uuid='desk-changer@eric.gach.gmail.com'
_install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

install -dm655 $_install_dir

cd  ${_pkgname}-version-${pkgver}/${_uuid}
cp -r * $_install_dir

}

sha512sums=('aec3f6f3c0024eb27b54a99302209bd1726d4460aece3bbefe2b2aea8ac4b7890aec537d5e75c4ba68bd75819046b0efa77a1a580b6dc7ecb94b2b42c38684c8')
