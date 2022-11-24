# Maintainer: nastyagrifon <neckronus@yandex.ru>
# Contributor: chaozhi_l <chaozhi_l@foxmail.com>
# Contributor: BigE <eric.gach@gmail.com>

pkgname=gnome-shell-extension-desk-changer
pkgver=35
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

sha512sums=('09dd5dc37d2850dff7f0582f9d35892be4280996c2acfe5861cdc3f5928b21817c9443c2dcb4bb614949b5c38bf21f720330ef53cb669e2b5990e044b7de3d2f')
