# Maintainer: chaozhi_l <chaozhi_l@foxmail.com>
# Contributor: BigE <eric.gach@gmail.com>

pkgname=gnome-shell-extension-desk-changer
pkgver=33
pkgrel=1
pkgdesc="DeskChanger is a gnome-shell wallpaper slideshow extension with multiple profile support. The extension allows you to switch profiles on the fly without reloading the daemon."
arch=('any')
url="https://github.com/BigE/desk-changer/"
license=('MIT')
depends=('gnome-shell>=3.40' 'gjs')
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

sha512sums=('cbe1ea599996d1bd864fea1864c5208ebe93e683202096d39d6861c0b8308d6ec30e85bd0652eb92f01f826bb7500f185d05e00825e5e65a48e0e21064cfbbb8')
