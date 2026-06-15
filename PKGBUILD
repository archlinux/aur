# Maintainer: SHORiN-KiWATA <fcl709@outlook.com>
pkgname=shorin-proton-wrapper-git
pkgver=r2.8a10b49
pkgrel=1
pkgdesc="Simple Proton wrapper for running Windows executables"
arch=('any')
url="https://github.com/SHORiN-KiWATA/proton-wrapper"
license=('MIT')
depends=('bash' 'python' 'zenity')
optdepends=(
  'steam: Steam runtime support'
  'lutris: Lutris runner support'
  'curl: download runners'
  'wget: alternative downloader'
)
makedepends=('git')
provides=('shorin-proton')
conflicts=('shorin-proton')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/proton-wrapper"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/proton-wrapper"

  install -Dm755 shorin-proton "$pkgdir/usr/bin/shorin-proton"
  install -Dm755 shorin-proton-select-prefix "$pkgdir/usr/bin/shorin-proton-select-prefix"
  install -Dm644 shorin-proton.desktop "$pkgdir/usr/share/applications/shorin-proton.desktop"
  install -Dm644 icons/shorin-proton.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/shorin-proton.svg"
}
