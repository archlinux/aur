# Maintainer: Odin Vex <https://aur.archlinux.org/account/OdinVex/>
pkgname=mint-artwork
pkgver=1.5.8
pkgrel=0
epoch=2
pkgdesc="Linux Mint Artwork and Resources."
arch=("any")
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=("GPL")
groups=("cinnamon")
depends=("hicolor-icon-theme" "lightdm-settings" "lightdm-slick-greeter"
         "mint-backgrounds" "mint-x-icons" "mint-y-icons" "mint-themes")
optdepends=("mint-themes-legacy: Legacy Mint themes")
conflicts=("lightdm-gtk-greeter" "lightdm-gtk-greeter-settings" "mint-sounds")
backup=(etc/lightdm/lightdm-gtk-greeter.conf)
options=("!strip" "libtool" "staticlibs" "!zipman" "!ccache")
install=mint-artwork.install
changelog=CHANGELOG
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
md5sums=("8efa28d2387e0b3f4baf2ce65ba44d02")
sha256sums=("3ca92a082afee527a91978b2faf5e9ff8707421e3e4725c06026ef14c85289b6")

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