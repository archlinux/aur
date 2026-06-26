# Maintainer: CxOrg <clx.org@cloud-org.uk>
pkgname=simplesinewavegenerator-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="Simple sine wave generator with GTK3 GUI and logarithmic frequency sweep (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/ixnewton/simpleSineWaveGenerator"
license=('MIT')
depends=('gtk3')
optdepends=('pulseaudio: PulseAudio backend (or pipewire-pulse)')
conflicts=('simplesinewavegenerator-git')
provides=('simplesinewavegenerator')
source=("https://github.com/ixnewton/simpleSineWaveGenerator/releases/download/v${pkgver}/simpleSineWaveGenerator-${pkgver}-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  
  # Install binary
  install -Dm755 simpleSineWaveGenerator "$pkgdir/usr/bin/simpleSineWaveGenerator"
  
  # Install desktop file
  install -Dm644 simplesinewavegenerator.desktop "$pkgdir/usr/share/applications/simplesinewavegenerator.desktop"
  
  # Install icon
  install -Dm644 simplesinewavegenerator.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/simplesinewavegenerator.svg"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
