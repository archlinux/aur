# Maintainer: ndom91
# Contributor: Drata
# Contributor: otaj
pkgname=drata-agent
pkgver=3.1.1
pkgrel=1
pkgdesc="The Drata Agent is a light-weight tray-application that runs in the background, reporting important read-only data to Drata about your machine’s state for compliance tracking."
arch=('x86_64')
url="https://github.com/drata/the-agent"
license=("custom:${pkgdir}/usr/share/licenses/${pkgname}/LICENSE")
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator-gtk3: systray indicator')
options=('!strip' '!emptydirs')
install=${pkgname}.install
validpgpkeys=('2DCE07BE62610800B1E4BEDE955D29B1F039BC43')
source_x86_64=("https://cdn.drata.com/agent/dist/linux/${pkgname}-${pkgver}.deb")
sha512sums_x86_64=('255afa09e96494387754e88ae7967979984992d29bafdb6f33fbcc38daa3c278ef54b45ca447b7601ecd768a5267d1271a6f1d3f5da1cb9635ddca986325b57f')

package(){
  cd "${srcdir}"

  # Extract debian package
  ar xf "${pkgname}"-"${pkgver}".deb

  # Extract data to pkgdir
  tar xf data.tar.xz -C "${pkgdir}/"

  # Install license file
  # install -Dm644 "${pkgdir}/opt/Drata Agent/LICENSES.chromium.html" "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
