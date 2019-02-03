# Maintainer: Lightwing <teddyzct[at]outlook[dot]com>
pkgname=fcitx-shuoxie-git
pkgver=current
pkgrel=2
pkgdesc="Input with speaking or handwriting (Simplified Chinese Only)"
url="https://gitee.com/hebinq/shuoxie"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('fcitx' 'gtk3')
optdepends=()
makedepends=('cmake' 'git')
conflicts=()
replaces=()
backup=()
install=()
source=()
md5sums=()
prepare() {
  cd "${srcdir}/"
  git clone https://gitee.com/hebinq/shuoxie.git
}
build() {
  cd "${srcdir}/shuoxie"
  cmake ./
  make
}

package() {
  cd "${srcdir}/shuoxie"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
