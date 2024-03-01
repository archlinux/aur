# Maintainer: Jaco Malan <jacom@codelog.co.za>
pkgname=unstoppableswap-gui-bin
pkgver=0.5.3
pkgrel=1
epoch=
pkgdesc="Graphical User Interface for trustless cross-chain XMR<>BTC Atomic Swaps."
arch=('x86_64')
url="https://unstoppableswap.net/"
license=('MIT')
groups=()
depends=('gtk3' 'nss' 'at-spi2-core' 'pango' 'glibc' 'expat' 'libxfixes' 'libxkbcommon' 'glib2' 'bash' 'cairo' 'libxext' 
  'dbus' 'python' 'alsa-lib' 'libxrandr' 'lib32-glibc' 'java-runtime' 'lib32-openssl-1.1' 'gcc-libs' 'nspr' 'make' 
  'gdk-pixbuf2' 'libxcomposite' 'libcups' 'hicolor-icon-theme' 'lib32-gcc-libs' 'libxdamage' 'libx11' 'libxcb' 'libdrm' 
  'mesa' 'lib32-zlib')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/UnstoppableSwap/unstoppableswap-gui/releases/download/v${pkgver}/unstoppableswap-gui_${pkgver}_amd64.deb")
noextract=("unstoppableswap-gui_${pkgver}_amd64.deb")
sha256sums=('35bfa2ab20fd5532abb1cb4bbe551b5027a713bdbdebed5bcf809523bf9b6828')
validpgpkeys=()

prepare() {
  cd "$srcdir"
  ar p unstoppableswap-gui_${pkgver}_amd64.deb data.tar.xz | tar Jx
}

package() {
  cp -r "$srcdir/opt" "$pkgdir"
  cp -r "$srcdir/usr" "$pkgdir"
  mkdir -p "$pkgdir/usr/bin"
  ln -sf "/opt/UnstoppableSwap/unstoppableswap-gui" "$pkgdir/usr/bin/unstoppableswap-gui"
  chmod 4755 "$pkgdir/opt/UnstoppableSwap/chrome-sandbox"
}
