# Maintainer: SHORiN-KiWATA <fcl709@outlook.com>
pkgname=shorin-proton-wrapper-git
pkgver=r55.eddee61
pkgrel=1
pkgdesc="Simple Proton wrapper for running Windows executables"
arch=('any')
url="https://github.com/SHORiN-KiWATA/proton-wrapper"
license=('MIT')
depends=('bash' 'python' 'python-gobject' 'gtk4' 'gamescope' 'icoextract' 'python-pillow' 'curl' 'lib32-cairo')
optdepends=(
  'steam: Steam runtime support'
  'lutris: Lutris runner support'
  'mangohud: performance overlay for --mangohud'
  'libnotify: desktop notifications during first run'
  'wget: alternative downloader'
)
makedepends=('git')
provides=('shorin-proton-wrapper')
conflicts=('shorin-proton-wrapper')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/proton-wrapper"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/proton-wrapper"
  install -Dm755 shorin-proton-wrapper "$pkgdir/usr/bin/shorin-proton-wrapper"
  install -Dm755 shorin-proton-wrapper-configure "$pkgdir/usr/bin/shorin-proton-wrapper-configure"
  install -Dm755 shorin-proton-wrapper-manager "$pkgdir/usr/bin/shorin-proton-wrapper-manager"
  install -Dm644 shorin-proton-wrapper-run-windows-program.desktop "$pkgdir/usr/share/applications/shorin-proton-wrapper-run-windows-program.desktop"
  install -Dm644 shorin-proton-wrapper-windows-program-configure.desktop "$pkgdir/usr/share/applications/shorin-proton-wrapper-windows-program-configure.desktop"
  install -Dm644 shorin-proton-wrapper-manager.desktop "$pkgdir/usr/share/applications/shorin-proton-wrapper-manager.desktop"
  install -Dm644 icons/shorin-proton.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/shorin-proton.png"
}
