# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=pmsg
pkgver=0.1
pkgrel=1
pkgdesc='Prompt notifications at certain intervals'
arch=('any')
url='http://github.com/xyproto/pmsg'
license=('GPL2')
optdepends=('zsh: for zsh support'
            'bash: for bash support'
            'fish: for fish support')
depends=('python')
makedepends=('setconf')
source=('git+https://github.com/xyproto/pmsg.git#commit=b057991c81ad88bdc3a3924cd5d0003f08268dc8')
md5sums=('SKIP')

prepare() {
  setconf $pkgname/install.sh SOURCE_DIR=/usr/share/$pkgname
}

package() {
  cd "$pkgname"

  install -Dm755 install.sh "$pkgdir/usr/bin/pmsg_setup"
  install -Dm644 pmsg "$pkgdir/usr/share/pmsg/pmsg"
  install -Dm644 time.example.conf "$pkgdir/usr/share/pmsg/time.example.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pmsg/LICENSE"
}

# vim: ts=2 sw=2 et:
