# Maintainer: Keiran <keiran0@proton.me>
pkgname=e-zshot
pkgver=1.0
pkgrel=1
pkgdesc="Python scripts for automatically taking screenshots and uploading them to e-z.host."
arch=('any')
url="https://github.com/RobinTT69/e-z-screenshot-linux"
license=('custom')
depends=('python')
source=("https://github.com/RobinTT69/e-z-screenshot-linux/releases/download/v1.0/e-zshot-1.0.tar.gz")
md5sums=('SKIP')

prepare() {
  cd "$srcdir"
  tar xzf e-zshot-${pkgver}.tar.gz
}

package() {
  cd "$srcdir"

  # Install Python scripts
  install -Dm755 e-z-flameshot.py "$pkgdir/usr/bin/e-z-flameshot"
  install -Dm755 e-z-grim.py "$pkgdir/usr/bin/e-z-grim"

  # Install README
  install -Dm644 README.md "$pkgdir/usr/share/doc/e-zshot/README.md"

  # Install fonts
  install -Dm644 fonts/impact.ttf "$pkgdir/usr/share/fonts/impact.ttf"
}
