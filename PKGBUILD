# Maintainer: duanluan <duanluan@outlook.com>

pkgname=axure-rp-10-wine
pkgver=10.0.0.3929
pkgrel=1
pkgdesc='Axure RP 10 prototyping tool running through a dedicated Wine prefix'
arch=('x86_64')
url='https://www.axure.com/release-history/rp10'
license=('LicenseRef-Proprietary')
depends=(
  'bash'
  'curl'
  'hicolor-icon-theme'
  'noto-fonts-cjk'
  'wine'
  'xorg-xrandr'
  'xorg-xrdb'
)
optdepends=(
  'winetricks: install .NET Framework 4.8 needed by Axure'
)
options=('!strip')
_installer='AxureRP-Setup-3929.exe'
source=(
  "${_installer}::https://axure.cachefly.net/versions/10-0/AxureRP-Setup-3929.exe"
  'axure-rp-10-wine'
  'axure-rp-10-wine.desktop'
  'axure-rp-10-wine.svg'
)
sha256sums=(
  'd2ac3c34ea36800b21be88d49c8c13f8d9425bcead480b34755cd2b26fa870fc'
  '9ac5855b9c415197b107922662111142be3a66d8d73f87692b6f1bd775a95a6b'
  '5c4a01f1053a90e9d40dc790b064f1204f84f2928a3944d1c33c5e458ff45f12'
  'e667e08c68b32c5a44832bfdd392415c2df5a55930892b36c5cc7bfc3fd28530'
)

package() {
  install -Dm755 "${srcdir}/axure-rp-10-wine" \
    "${pkgdir}/usr/bin/axure-rp-10-wine"
  install -Dm644 "${srcdir}/axure-rp-10-wine.desktop" \
    "${pkgdir}/usr/share/applications/axure-rp-10-wine.desktop"
  install -Dm644 "${srcdir}/axure-rp-10-wine.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/axure-rp-10-wine.svg"
  install -Dm644 "${srcdir}/${_installer}" \
    "${pkgdir}/usr/share/${pkgname}/${_installer}"
}
