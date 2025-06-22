# Maintainer: Yatharth Jain <yatharth3194@gmail.com>

_tag=cb55a809a5ec8ef636cf2d234d92d8ce35123dc6 # Replace with the actual tag if needed
_sourceName="bgclicker"

pkgname=bgclicker-git
pkgver=1.0.0 # Replace with your actual version
pkgrel=1
pkgdesc="A simple Python application with a GUI for performing background mouse clicks and keyboard inputs."
arch=('any')
url="https://github.com/Venom120/bgclicker" # Replace with your actual repo URL
license=('MIT') # Based on LICENSE file
depends=('python' 'tk' 'python-keyboard' 'xdotool')
makedepends=(git)
source=(git+${url}.git)
sha256sums=('SKIP') # Use 'SKIP' for git sources

package() {
  cd "${_sourceName}"
  # Install the main script
  install -Dm 755 main.py "${pkgdir}/usr/bin/${pkgname}"

  # Install the License file
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install the desktop entry
  install -Dm 644 "bgclicker.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install the icon
  install -Dm 644 "bgclicker.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}