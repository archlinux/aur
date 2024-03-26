# Maintainer: nastyagrifon <me@nastyagrifon.me>
# Contributor: chaozhi_l <chaozhi_l@foxmail.com>
# Contributor: BigE <eric.gach@gmail.com>

pkgname=gnome-shell-extension-desk-changer
pkgver=36
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

sha512sums=('9e8cbaba006382194f1a43797f778d73e49809093cf49d0aa16db9089c87c323503919d08ec68e89df7c5ebbf46d1e0b62e23bf1b96b65f0d82b98616729b710')
