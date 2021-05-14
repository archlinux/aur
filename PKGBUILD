# Maintainer: DelightedCat <bottledlactose@gmail.com>

# This PKGBUILD is meant for those who have a purchased license for Aseprite.
# In order to use this script, place the downloaded .deb file next to this PKGBUILD file.
#
# Then go ahead and build your package as usual with makepkg!

pkgname=aseprite-bin
_pkgver=1.2.27-1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Create animated sprites and pixel art"
arch=('x86_64')
url="https://www.aseprite.org/"
license=('custom: aseprite EULA')
depends=(libglvnd fontconfig libxcursor)
provides=(aseprite)
conflicts=(aseprite)
source=("local://Aseprite_${_pkgver}_amd64.deb")
md5sums=("070a5cdf64f666c8a6e03739f4a06213")

package() {
    tar xf data.tar.xz -C $pkgdir

    chmod -R 755 $pkgdir/usr
    chmod +x $pkgdir/usr/bin/aseprite

    install -d "${pkgdir}/usr/share/licenses/${pkgname}/"

    cp -r "${pkgdir}"/usr/share/doc/aseprite/EULA.txt \
          "${pkgdir}/usr/share/licenses/${pkgname}/"

    cp -r "${pkgdir}"/usr/share/doc/aseprite/docs/LICENSES.md \
          "${pkgdir}/usr/share/licenses/${pkgname}/"
}
