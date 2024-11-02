# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=midori-bin
pkgver=11.4.1
pkgrel=1
pkgdesc="Browser fork of Floorp fork of Firefox by Astian"
arch=(x86_64)
url="https://astian.org/midori-browser/"
license=(MPL-2.0)
depends=(gtk3 alsa-lib nspr dbus-glib nss

         # namcap implicit depends
         libxcb dbus gcc-libs glib2 cairo fontconfig libxrandr libxfixes libxcursor freetype2 libxi gdk-pixbuf2 glibc
         libxcomposite libxext pango libxrender libx11 libxdamage at-spi2-core libxtst hicolor-icon-theme)
provides=(midori)
conflicts=(midori)
source_x86_64=(#"https://github.com/goastian/midori-desktop/releases/download/v${pkgver}/midori_${pkgver}_amd64.deb"
               "https://github.com/goastian/midori-desktop/releases/download/v11.4.1/midori-browser-11.4.1-1.1.x86_64.rpm"
               #"https://github.com/goastian/midori-desktop/releases/download/v${pkgver}/midori-${pkgver}.linux-x86_64.tar.bz2"
)
sha256sums_x86_64=('82baddd912db5aa3880986a8729c1c32a2bec519030cf0731a1dc6ee15e68e3f')
options=(!strip)

package() {
  #bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  cp -a "${srcdir}"/usr "${pkgdir}"/
  mv  "${pkgdir}"/usr/lib64/* "${pkgdir}/usr/lib"
  rmdir "${pkgdir}"/usr/lib64
}
