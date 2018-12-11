_name="movie-monad"
_ver="0.0.7.0"
_xrev="0"

pkgname="${_name}"
pkgver="${_ver}_${_xrev}"
pkgrel=1
pkgdesc="A free and simple to use video player made with Haskell."
url="https://github.com/lettier/${_name}"
license=("BSD3")
arch=("x86_64")
makedepends=()
depends=("gtk3" "gstreamer" "gst-plugins-base-libs" "gst-plugins-base" "gst-plugins-good")
options=()
source=("https://www.github.com/lettier/${_name}/releases/download/${_ver}/${_name}-linux-${_ver}.tar.gz")
md5sums=('3d1f8b3bb8a18ae1819212f48ff90ad2')

package() {
  cd "${srcdir}/${_name}-linux-${_ver}"
  mkdir -p \
    "${pkgdir}/opt/${_name}-linux-${_ver}/" \
    "${pkgdir}/usr/bin/" \
    "${pkgdir}/usr/share/applications/" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  cp -RP . "${pkgdir}/opt/${_name}-linux-${_ver}/"
  cp "./share/applications/com.lettier.${_name}.desktop" "${pkgdir}/usr/share/applications/"
  cp "./share/icons/hicolor/scalable/apps/com.lettier.${_name}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  ln -s "/opt/${_name}-linux-${_ver}/bin/${_name}" "${pkgdir}/usr/bin/${_name}"
}
