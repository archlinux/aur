# Maintainer: Cédric 'Sed' FARINAZZO <cedric.farinazzo@gmail.com>

pkgname=serenade.ai
pkgver=1.6.3
pkgrel=1
pkgdesc="Serenade is the most powerful way to program using natural speech."
url="https://serenade.ai"
arch=('any')
license=()
install='serenadeai.install'
provides=('serenade.ai')

_appimage="Serenade-${pkgver}.AppImage"
source=("${_appimage}::https://cdn.serenade.ai/app/Serenade-${pkgver}.AppImage")
sha1sums=('734857e0344c12dcfacf871505ba31b9750fe856')
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

