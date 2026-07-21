# Maintainer: Prabakaran (bdh) 

pkgname=bdh-linux-ide
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple, lightweight terminal-based IDE using Tmux, Ranger, and Nano."
arch=('any')
url="https://github.com/BackendDeveloperHub/bdh-linux-ide"
license=('GNU General Public License')
depends=('tmux' 'ranger' 'nano' 'bash')
source=("git+$url.git")
sha256sums=('SKIP')

package() {
  cd "$pkgname"
  
  # Arch Linux விதிகளின்படி /usr/local/bin-க்கு பதிலாக /usr/bin பயன்படுத்த வேண்டும்
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/etc/bdh-ide"

  # Executable ஃபைல்களை இன்ஸ்டால் செய்ய
  install -Dm755 bdh-ide "$pkgdir/usr/bin/bdh-ide"
  install -Dm755 bdh-ide-kill "$pkgdir/usr/bin/bdh-ide-kill"

  # Config ஃபைல்களை இன்ஸ்டால் செய்ய
  install -Dm644 configs/tmux.conf "$pkgdir/etc/bdh-ide/tmux.conf"
  install -Dm644 configs/nanorc "$pkgdir/etc/bdh-ide/nanorc"
  install -Dm644 configs/ide_layout.tz "$pkgdir/etc/bdh-ide/ide_layout.tz"
}
