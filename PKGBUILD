# Maintainer: Ostojλ <OstojaSredojevic@protonmail.com>
pkgname=roon-dunst-now-playing-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple Roon extension that uses notify-send"
arch=('any')
url="https://github.com/OstojaOfficial/roon-dunst-now-playing"
license=('MIT')
depends=('nodejs' 'roon-kit' 'dunst')
makedepends=('git')
conflicts=('roon-now-playing-git')
source=("git+$url.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/roon-dunst-now-playing"
  mkdir -p ${pkgdir}/opt/${pkgname}
  install -Dm644 "roon-dunst-now-playing.js" "$pkgdir/opt/$pkgname/roon-dunst-now-playing.js"
  install -Dm644 "roon-dunst-now-playing.service" "$pkgdir/usr/lib/systemd/user/roon-dunst-now-playing.service"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}