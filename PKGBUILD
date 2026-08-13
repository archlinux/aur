# Maintainer: Kavy-Codes <kavyatiwari.dev@gmail.com>
pkgname=audion-bin
_pkgname=audion
pkgver=1.3.9
pkgrel=1
pkgdesc="A modern, local music player with a Spotify-inspired interface featuring synced lyrics (Pre-compiled Binary)"
arch=('x86_64')
url="https://github.com/dupitydumb/Audion"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'openssl' 'libayatana-appindicator' 'hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux.deb")
sha256sums=('SKIP')

package() {
  if [ -f data.tar.xz ]; then
    tar -xJf data.tar.xz -C "${pkgdir}"
  elif [ -f data.tar.zst ]; then
    tar -xI zstd -xf data.tar.zst -C "${pkgdir}"
  else
    tar -xzf data.tar.gz -C "${pkgdir}"
  fi

  mkdir -p "${pkgdir}/usr/share/icons/hicolor"
}
