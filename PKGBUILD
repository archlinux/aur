# Maintainer: Castor <whoisyoges at castorisdead dot xyz>
pkgname=emojimenu
pkgver=1.0
pkgrel=0
pkgdesc="Search, copy and insert any emoji by name from dmenu/rofi."
arch=('any')
url="https://github.com/whoisyoges/emojimenu"
license=('GPL2')
depends=('dmenu' 'xclip' 'xdotool' 'sed')
optdepends=('rofi' 'libnotify')
makedepends=('git')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/$pkgname"
  chmod +x emojimenu
  install -Dm755 emojimenu "${pkgdir}/usr/local/bin/emojimenu"
  install -Dm644 allemojis.txt "${pkgdir}/usr/share/emojimenu/allemojis.txt"
}
