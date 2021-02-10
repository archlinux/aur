# Maintainer: gkmcd <g at dramati dot cc>
# Contributor: dude <brrtsm at gmail dot com>

pkgname=gnome-shell-extension-desk-changer
pkgver=30
pkgrel=3
pkgdesc="DeskChanger is a gnome-shell wallpaper slideshow extension with multiple profile support. The extension allows you to switch profiles on the fly without reloading the daemon."
arch=('any')
url="https://github.com/BigE/desk-changer/"
license=('MIT')
depends=('gnome-shell>=3.30' 'gjs')
source=("https://github.com/BigE/desk-changer/archive/version-${pkgver}.tar.gz")

sha512sums=('995cee92742b25f61e61b32f90f65455c53220428a545c45425234010d0166593aab995e595cb9fbd6b23fc44d35c8d88f7bb9ea570f3e5cbae7c40e87be0987')

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
