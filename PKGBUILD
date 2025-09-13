# Maintainer: Odin Vex <https://aur.archlinux.org/account/OdinVex/>
pkgname=mint-artwork
pkgver=1.9.2
pkgrel=0
epoch=2
pkgdesc="Linux Mint Artwork and Resources."
arch=("any")
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=("GPL")
groups=("cinnamon")
depends=("hicolor-icon-theme" "lightdm-settings" "lightdm-slick-greeter"
         "mint-backgrounds" "mint-x-icons" "mint-y-icons" "mint-themes"
         "bibata-cursor-theme" )
conflicts=("lightdm-gtk-greeter" "lightdm-gtk-greeter-settings" "mint-sounds")
backup=(etc/lightdm/lightdm-gtk-greeter.conf)
options=("!strip" "libtool" "staticlibs" "!zipman" "!ccache")
install=mint-artwork.install
changelog=CHANGELOG
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
md5sums=('b1ab00d80f0d87bc38b73424942d9aba')
sha256sums=('ce6569cbb4f5032544e67c03d1a67fffd90814ad88623977ad2abef5b7073c31')

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
