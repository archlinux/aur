# Maintainer: Lettier <movie_monad_aur a@@at@t lettier dd.ot..t ccommm>

_name="movie-monad"
_ver=0.0.5.0
_xrev=0

pkgname=${_name}
pkgver=${_ver}_${_xrev}
pkgrel=1
pkgdesc="A free and simple to use video player made with Haskell."
url="https://github.com/lettier/${_name}"
license=("BSD3")
arch=("x86_64")
makedepends=()
depends=("gtk3" "gstreamer" "gst-libav" "gst-plugins-base-libs" "gst-plugins-base" "gst-plugins-good" "gst-plugins-bad")
options=()
source=("https://www.github.com/lettier/${_name}/releases/download/${_ver}/${_name}-linux-${_ver}.tar.gz")
md5sums=('fc6775656d866772b557438aff465f4b')

package() {
  cd "${srcdir}/${_name}-linux-${_ver}"
  mkdir -p \
    "${pkgdir}/opt/${_name}-linux-${_ver}/" \
    "${pkgdir}/usr/bin/" \
    "${pkgdir}/usr/share/applications/" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  cp -RP . "${pkgdir}/opt/${_name}-linux-${_ver}/"
  cp "./share/applications/${_name}.desktop" "${pkgdir}/usr/share/applications/"
  cp "./share/icons/hicolor/scalable/apps/${_name}-icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  ln -s "/opt/${_name}-linux-${_ver}/bin/${_name}" "${pkgdir}/usr/bin/${_name}"
}
