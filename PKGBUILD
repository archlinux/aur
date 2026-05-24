# Maintainer: Brandon Doornbos <b.doornbos@pm.me>
pkgname=cfait-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="Powerful, fast and elegant task / TODO manager (GUI & TUI, CalDAV & local). Cfait is a powerful yet simple tasks / TODO CalDAV client. (TUI and GUI)"
arch=('x86_64')
url="https://codeberg.org/trougnouf/cfait"
license=('GPL-3.0-or-later')
conflicts=('cfait')
options=('!strip' '!emptydirs')
source_x86_64=("https://github.com/trougnouf/cfait/releases/download/v1.0.2/cfait_1.0.2-1_amd64.deb")
sha256sums_x86_64=('038efcbe958f343d6e720aa85994bf3acca259f84f2dfa14e497b90d3e6eccd6')
depends=(
    'gcc-libs'
    'glibc'
    'fontconfig'              # Required by the GUI for system font discovery
    'libxkbcommon'            # Required by the GUI for keyboard handling (especially on Wayland)
    'vulkan-icd-loader'       # Required by the GUI to load Vulkan drivers for rendering
    'org.freedesktop.secrets' # Required to store the CalDAV password
)
optdepends=(
    'vulkan-driver: Required by the GUI for hardware-accelerated rendering'
    'wayland: Required by the GUI for Wayland session support'
    'libx11: Required by the GUI for X11 session support'
    'libxcursor: Required by the GUI for X11 cursor support'
    'libxi: Required by the GUI for X11 input devices'
    'libxrandr: Required by the GUI for X11 monitor layout support'
    'xdg-desktop-portal: Required by the GUI for the file picker (export/import)'
)
provides=('cfait' 'cfait-gui')

package() {
    tar -xJ -f data.tar.xz -C "${pkgdir}"
}
