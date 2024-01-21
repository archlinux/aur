# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=rpcs3-bin
pkgver=0.0.30
_pkgbuild='15994-8eae8cb8'
pkgrel=2
pkgdesc='Open-source Sony PlayStation 3 Emulator'
arch=('x86_64')
url='https://rpcs3.net/'
license=('GPL2')
depends=(
  alsa-lib
  glew
  glu
  libevdev
  libgl
  libice
  libpng
  libpulse
  libsm
  libx11
  libxext
  ncurses5-compat-libs
  openal
  qt6-base
  qt6-declarative
  qt6-multimedia
  qt6-svg
  sdl2
  vulkan-icd-loader
  zlib
  curl
  wolfssl
  flatbuffers
  pugixml
)
makedepends=('p7zip')
options=('!strip')
replaces=('rpcs3')
provides=('rpcs3')
conflicts=('rpcs3')
# curl --silent --dump-header - https://github.com/RPCS3/rpcs3-binaries-linux/releases/latest | grep -i '^location: ' | sed 's#/tag/#/download/#'
_latest_release="https://github.com/RPCS3/rpcs3-binaries-linux/releases/download/build-8eae8cb86c740317abe3b9e88e73d661d210d67b"
source=("${_latest_release}/rpcs3-v$pkgver-${_pkgbuild}_linux64.AppImage")
sha256sums=('16abd75cd5918aa584dae92c49c39e2f590afdfe4e9df4e0fbe519b5d26c53c4')

prepare()
{
    cd "$srcdir"

    7z x -y "$srcdir/rpcs3-v$pkgver-${_pkgbuild}_linux64.AppImage"
}

package()
{
    cd "${srcdir}"

    install -D -m755 'usr/bin/rpcs3' "$pkgdir/usr/bin/rpcs3"
    install -D -m644 'usr/share/applications/rpcs3.desktop' "$pkgdir/usr/share/applications/rpcs3.desktop"
    install -D -m644 'usr/share/icons/hicolor/48x48/apps/rpcs3.png' "$pkgdir/usr/share/icons/hicolor/48x48/apps/rpcs3.png"
    install -D -m644 'usr/share/icons/hicolor/scalable/apps/rpcs3.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/rpcs3.svg"
    install -D -m644 'usr/share/metainfo/rpcs3.metainfo.xml' "$pkgdir/usr/share/memetainfo/rpcs3.metainfo.xml"
    install -D -m644 'usr/share/rpcs3/Icons/ui/circle.png' "$pkgdir/usr/share/rpcs3/Icons/ui/circle.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/cross.png' "$pkgdir/usr/share/rpcs3/Icons/ui/cross.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/dpad_down.png' "$pkgdir/usr/share/rpcs3/Icons/ui/dpad_down.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/dpad_left.png' "$pkgdir/usr/share/rpcs3/Icons/ui/dpad_left.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/dpad.png' "$pkgdir/usr/share/rpcs3/Icons/ui/dpad.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/dpad_right.png' "$pkgdir/usr/share/rpcs3/Icons/ui/dpad_right.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/dpad_up.png' "$pkgdir/usr/share/rpcs3/Icons/ui/dpad_up.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/fade_bottom.png' "$pkgdir/usr/share/rpcs3/Icons/ui/fade_bottom.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/fade_top.png' "$pkgdir/usr/share/rpcs3/Icons/ui/fade_top.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/L1.png' "$pkgdir/usr/share/rpcs3/Icons/ui/L1.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/L2.png' "$pkgdir/usr/share/rpcs3/Icons/ui/L2.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/left_stick.png' "$pkgdir/usr/share/rpcs3/Icons/ui/left_stick.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/new.png' "$pkgdir/usr/share/rpcs3/Icons/ui/new.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/R1.png' "$pkgdir/usr/share/rpcs3/Icons/ui/R1.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/R2.png' "$pkgdir/usr/share/rpcs3/Icons/ui/R2.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/right_stick.png' "$pkgdir/usr/share/rpcs3/Icons/ui/right_stick.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/save.png' "$pkgdir/usr/share/rpcs3/Icons/ui/save.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/select.png' "$pkgdir/usr/share/rpcs3/Icons/ui/select.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/square.png' "$pkgdir/usr/share/rpcs3/Icons/ui/square.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/start.png' "$pkgdir/usr/share/rpcs3/Icons/ui/start.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/triangle.png' "$pkgdir/usr/share/rpcs3/Icons/ui/triangle.png"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/Classic (Bright).qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/Classic (Bright).qss"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/Darker Style by TheMitoSan.qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/Darker Style by TheMitoSan.qss"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/Envy.qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/Envy.qss"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/kot-bg.jpg' "$pkgdir/usr/share/rpcs3/GuiConfigs/kot-bg.jpg"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/Kuroi (Dark) by Ani.qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/Kuroi (Dark) by Ani.qss"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/list_arrow_blue.png' "$pkgdir/usr/share/rpcs3/GuiConfigs/list_arrow_blue.png"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/list_arrow_down_blue.png' "$pkgdir/usr/share/rpcs3/GuiConfigs/list_arrow_down_blue.png"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/list_arrow_down_green.png' "$pkgdir/usr/share/rpcs3/GuiConfigs/list_arrow_down_green.png"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/list_arrow_down_white.png' "$pkgdir/usr/share/rpcs3/GuiConfigs/list_arrow_down_white.png"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/list_arrow_green.png' "$pkgdir/usr/share/rpcs3/GuiConfigs/list_arrow_green.png"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/list_arrow_white.png' "$pkgdir/usr/share/rpcs3/GuiConfigs/list_arrow_white.png"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/ModernBlue Theme by TheMitoSan.qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/ModernBlue Theme by TheMitoSan.qss"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/Nekotekina by GooseWing.qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/Nekotekina by GooseWing.qss"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/Skyline (Nightfall).qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/Skyline (Nightfall).qss"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/Skyline.qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/Skyline.qss"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/YoRHa-background.jpg' "$pkgdir/usr/share/rpcs3/GuiConfigs/YoRHa-background.jpg"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/YoRHa by Ani.qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/YoRHa by Ani.qss"
}
