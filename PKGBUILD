# Maintainer: ndom91
# Contributor: Drata
# Contributor: otaj
pkgname=drata-agent
pkgver=3.2.0
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
sha512sums_x86_64=('6c35f266150916de93189890ab56cafbad4ca57d8868d646bd9c2397917378d94a995bcee375ff430ed486edc07cdceb5b75cb340e01a996738674727fad7634')

package(){
  cd "${srcdir}"

  # Extract debian package
  ar xf "${pkgname}"-"${pkgver}".deb

  # Extract data to pkgdir
  tar xf data.tar.xz -C "${pkgdir}/"

  # Install license file
  # install -Dm644 "${pkgdir}/opt/Drata Agent/LICENSES.chromium.html" "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
