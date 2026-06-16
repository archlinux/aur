# Maintainer: SHORiN-KiWATA <fcl709@outlook.com>
pkgname=shorin-proton-wrapper-git
pkgver=r10.4825f24
pkgrel=1
pkgdesc="Simple Proton wrapper for running Windows executables"
arch=('any')
url="https://github.com/SHORiN-KiWATA/proton-wrapper"
license=('MIT')
depends=('bash' 'python' 'python-gobject' 'gtk4')
optdepends=(
  'steam: Steam runtime support'
  'lutris: Lutris runner support'
  'curl: download runners'
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
  install -Dm755 shorin-proton-wrapper-select "$pkgdir/usr/bin/shorin-proton-wrapper-select"
  install -Dm644 shorin-proton-wrapper-run-windows-program.desktop "$pkgdir/usr/share/applications/shorin-proton-wrapper-run-windows-program.desktop"
  install -Dm644 shorin-proton-wrapper-run-windows-program-select.desktop "$pkgdir/usr/share/applications/shorin-proton-wrapper-run-windows-program-select.desktop"
  install -Dm644 icons/shorin-proton.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/shorin-proton.svg"
}
