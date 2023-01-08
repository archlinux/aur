# Maintainer: Cédric 'Sed' FARINAZZO <cedric.farinazzo@gmail.com>

pkgname=serenade.ai
pkgver=2.0.2
pkgrel=1
pkgdesc="Serenade is the most powerful way to program using natural speech."
url="https://serenade.ai"
arch=('any')
license=()
install='serenadeai.install'
provides=('serenade.ai')

_appimage="Serenade-${pkgver}.AppImage"
source=("${_appimage}::https://serenadecdn.com/app/Serenade-${pkgver}.AppImage")
sha1sums=('19361df2b91ca444400b4e7da368c52b4c5d32ec')
noextract=("${_appimage}")

prepare() {
  cd "${srcdir}"

  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

package() {
  mkdir -p "${pkgdir}/usr/share/"

  cp -r "${srcdir}/squashfs-root" "${pkgdir}/usr/share/Serenade.ai"
  chmod -R 755 "${pkgdir}/usr/share/Serenade.ai"
}

