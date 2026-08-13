# Maintainer: exteraDere <https://github.com/mizukika/osu-stable-arch-linux>

pkgname=osu-stable-arch-git
pkgver=1.1.0
pkgrel=1
pkgdesc="Automated osu! Stable installer & low-latency PipeWire audio manager for Arch Linux"
arch=('x86_64')
url="https://github.com/mizukika/osu-stable-arch-linux"
license=('MIT')
depends=('bash' 'wget' 'curl' 'unzip' 'p7zip' 'xdg-utils' 'desktop-file-utils' 'git' 'cabextract')
optdepends=(
  'wine: System Wine fallback'
  'winetricks: Windows components setup'
  'pipewire: Low-latency audio server'
  'wireplumber: PipeWire session manager'
  'realtime-privileges: Realtime group privileges'
)
provides=('osu-stable-arch')
conflicts=('osu-stable-arch')
source=("git+$url.git")
sha256sums=('SKIP')

package() {
  cd "osu-stable-arch-linux"
  install -Dm755 osu-install.sh "$pkgdir/usr/bin/osu-install"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
