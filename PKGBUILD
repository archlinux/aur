# Maintainer: Mathis <999frostz@gmail.com>
pkgname=screenix-bin
pkgver=1.8.3
pkgrel=1
pkgdesc="Professional screen recorder with smooth zoom effects"
arch=('x86_64')
url="https://github.com/mathisdev7/screenix"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'glib2'
  'gdk-pixbuf2'
  'cairo'
  'pango'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-libav'
  'ffmpeg'
  'tesseract'
  'tesseract-data-eng'
  'xdotool'
  'grim'
  'gnome-screenshot'
  'pipewire'
  'vulkan-icd-loader'
  'wireplumber'
  'xdg-desktop-portal'
)
optdepends=(
  'gst-plugins-bad: additional media codec support'
  'gst-plugins-ugly: additional media codec support'
  'xdg-desktop-portal-kde: portal backend for KDE Plasma'
  'xdg-desktop-portal-hyprland: portal backend for Hyprland'
  'xdg-desktop-portal-wlr: portal backend for Sway/wlroots compositors'
  'xdg-desktop-portal-gnome: portal backend for GNOME'
  'xdg-desktop-portal-gtk: portal backend fallback for other desktops'
)
provides=('screenix')
conflicts=('screenix')
options=('!strip' '!debug')
source=("https://github.com/mathisdev7/screenix-releases/releases/download/v${pkgver}/Screenix_${pkgver}_amd64.deb")
sha256sums=('ea28cbe604f41d9ffa31d5e6d625d8f14c3b0fc6ba4f077919dbb6a7ad8f2a48')

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}/"
}
