# Maintainer: UPdullah895 <abdullahbomozh@gmail.com>
pkgname=opengg-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Open-source Linux gaming hub — OpenGG"
arch=('x86_64')
url="https://github.com/UPdullah895/opengg"
license=('MIT')
depends=('pipewire' 'wireplumber' 'ffmpeg' 'gstreamer' 'webkit2gtk-4.1')
optdepends=('polkit: for privileged device setup')
provides=('opengg')
conflicts=('opengg')
install=opengg.install
source=("${url}/releases/download/v${pkgver}/opengg-v${pkgver}-linux-x86_64.tar.gz"
        "opengg.png::${url}/raw/refs/tags/v${pkgver}/frontend/src-tauri/icons/256x256.png")
sha256sums=('SKIP' 'SKIP')

package() {
  tar -xzf "${srcdir}/opengg-v${pkgver}-linux-x86_64.tar.gz" -C "${pkgdir}" --strip-components=1

  install -Dm644 "${srcdir}/opengg.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/opengg.png"

  cat > "${pkgdir}/usr/share/applications/opengg.desktop" << 'EOF'
[Desktop Entry]
Name=OpenGG
GenericName=Gaming Hub
Comment=Unified audio mixer, device/RGB manager, and instant replay for Linux gaming
Exec=opengg
Icon=opengg
Terminal=false
Type=Application
Categories=Game;AudioVideo;Settings;
Keywords=gaming;audio;mixer;replay;rgb;equalizer;pipewire;sonar;moments;
StartupNotify=true
StartupWMClass=opengg
EOF
}
