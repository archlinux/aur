# Maintainer: Arctic Ice Studio <development@arcticicestudio.com>
# Contributor: Arctic Ice Studio <development@arcticicestudio.com>
pkgname=mqttfx-bin
_pkgbasename=mqttfx
pkgver=1.7.0
pkgrel=1
pkgdesc="A MQTT Client written in Java based on Eclipse Paho"
arch=("x86_64")
url="http://mqttfx.org"
license=("Apache")
options=("!strip")
source=(
  "http://www.jensd.de/apps/${_pkgbasename}/${pkgver}/${_pkgbasename}-${pkgver}-64bit.deb"
  "${_pkgbasename}.desktop"
  "${_pkgbasename}.png"
)
sha256sums=(
  "06153aa3176e74ee8e8d5995ff6f9b74bc57327987f934a7b1688a30fcdc5a3f"
  "741674f5b782aa4de0b071b7f49484b74ee2150e38b5d83eb4bd00b172978e2a"
  "6c1b23755d3b1832ddb643b585d623128cde38e2ef42e7839141cf2106b0a59e"
)

package() {
  cd "${srcdir}"

  # Extract the application data into the package directory root
  tar -xJf data.tar.xz -C "${pkgdir}"

  # Install the binary directory and link into package
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgbasename}/${_pkgbasename}" "${pkgdir}/usr/bin/${_pkgbasename}"

  # Install the application logo and desktop launcher
  install -Dm644 "${_pkgbasename}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgbasename}.png"
  install -Dm644 "${_pkgbasename}.desktop" "${pkgdir}/usr/share/applications/${_pkgbasename}.desktop"
}
