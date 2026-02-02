# Maintainer: Ariel Baron <arielbar80@gmail.com>
pkgname=dotidx
pkgver=1.0.2
pkgrel=1
pkgdesc="A declarative, multi-profile dotfile manager focused on physical isolation and manifest-based tracking."
arch=('any')
url="https://github.com/ArielBaron/dotidx"
license=('MIT')
depends=('python' 'python-rich' 'rsync')
makedepends=('git')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -d "$pkgdir/usr/share/dotidx"
  install -d "$pkgdir/usr/bin"
  install -m755 main.py "$pkgdir/usr/share/dotidx/main.py"
  install -m644 interactive.py "$pkgdir/usr/share/dotidx/interactive.py"
  cp -r scripts "$pkgdir/usr/share/dotidx/"
  chmod +x "$pkgdir/usr/share/dotidx/scripts/"*.sh
  ln -sf /usr/share/dotidx/main.py "$pkgdir/usr/bin/dotidx"
}
