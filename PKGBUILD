# Maintainer: Odin Vex <https://aur.archlinux.org/account/OdinVex/>
pkgname=mint-artwork
pkgver=1.5.3
pkgrel=1
epoch=0
pkgdesc="Linux Mint Artwork and Resources."
arch=("any")
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=("GPL")
groups=("cinnamon")
depends=("hicolor-icon-theme" "lightdm-settings" "lightdm-slick-greeter" "mint-backgrounds" "mint-x-icons" "mint-y-icons" "mint-themes")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=("lightdm-gtk-greeter" "lightdm-gtk-greeter-settings" "mint-sounds")
replaces=()
backup=(etc/lightdm/lightdm-gtk-greeter.conf)
options=("!strip" "libtool" "staticlibs" "!zipman" "!ccache")
install=mint-artwork.install
changelog=CHANGELOG
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
noextract=()
noupgrade=()
md5sums=('fe1fdf84cd1443995ab16d4759ed0661')
validpgpkeys=()

package() {

  mkdir --parents ${pkgdir}/etc/lightdm/
  mkdir --parents ${pkgdir}/usr/bin/
  mkdir --parents ${pkgdir}/usr/share/backgrounds/linuxmint/

  cp --archive ${srcdir}/${pkgname}/etc/lightdm/lightdm-gtk-greeter.conf.d/99_linuxmint.conf ${pkgdir}/etc/lightdm/lightdm-gtk-greeter.conf
  cp --archive ${srcdir}/${pkgname}/etc/skel ${pkgdir}/etc
  cp --archive ${srcdir}/${pkgname}/etc/xdg ${pkgdir}/etc
  cp --archive ${srcdir}/${pkgname}/usr/bin/sha256sum-mint ${pkgdir}/usr/bin/sha256sum-mint
  cp --archive ${srcdir}/${pkgname}/usr/share/* ${pkgdir}/usr/share/
}
