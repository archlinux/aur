# Maintainer: Lettier <gifcurry_aur a@@at@t lettier dd.ot..t ccommm>

_name=gifcurry
_ver=3.0.0.1
_xrev=0

pkgname=${_name}
pkgver=${_ver}_${_xrev}
pkgrel=1
pkgdesc="Your open source video to GIF maker built with Haskell."
url="https://github.com/lettier/gifcurry"
license=("BSD3")
arch=("x86_64")
makedepends=()
depends=("gtk3" "ffmpeg" "imagemagick" "gstreamer" "gst-libav" "gst-plugins-base-libs" "gst-plugins-base" "gst-plugins-good" "gst-plugins-bad")
options=()
source=("https://www.github.com/lettier/${_name}/releases/download/${_ver}/${_name}-linux-${_ver}.tar.gz")
md5sums=('f4c11aa1c7e1f091dc7c51af35b6a232')

package() {
  cd "${srcdir}/${_name}-linux-${_ver}"
  mkdir -p \
    "${pkgdir}/opt/${_name}-linux-${_ver}/" \
    "${pkgdir}/usr/bin/" \
    "${pkgdir}/usr/share/applications/" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  cp -RP . "${pkgdir}/opt/${_name}-linux-${_ver}/"
  cp ./share/applications/gifcurry.desktop "${pkgdir}/usr/share/applications/"
  cp ./share/icons/hicolor/scalable/apps/gifcurry-icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  ln -s "/opt/${_name}-linux-${_ver}/bin/gifcurry_gui" "${pkgdir}/usr/bin/gifcurry_gui"
  ln -s "/opt/${_name}-linux-${_ver}/bin/gifcurry_cli" "${pkgdir}/usr/bin/gifcurry_cli"
}
