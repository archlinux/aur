# Maintainer: Ariel Baron <arielbar80@gmail.com>
pkgname=dotidx
pkgver=2.0.5
pkgrel=1
pkgdesc="A declarative, multi-profile dotfile manager focused on physical isolation and manifest-based tracking."
arch=('any')
url="https://github.com/ArielBaron/dotidx"
license=('MIT')
depends=('python' 'python-rich' 'rsync')
makedepends=('git')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('968f92d86e25e02cbc284a3aa85ff7d6c51d246e5c52f30fcb6375e065d2bd74')

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
