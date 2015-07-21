# Maintainer: XIE Yuheng <xyheme@gmail.com>

pkgname=cicada-git
pkgver=2015.06.24
pkgrel=1
pkgdesc="programming language with the following features
1. threaded code based
2. aggressively developed
3. never provide backward compatibility
[github git version]"
url="http://cicada-language.github.io/"
makedepends=('git')
depends=('fasm-linux-git')
license=('custom')
arch=('any')
source=('git+https://github.com/cicada-language/cicada.git')
provides=('cicada')
conflicts=('cicada')
md5sums=('SKIP')
install=cicada-git.install

build() {
  cd "$srcdir/cicada"
  make build
}

package() {
  cd "$srcdir/cicada"
  make PREFIX="$pkgdir/usr" install
  install -D -m644 LICENSE/LICENSE-of-cicada -t "${pkgdir}/usr/share/licenses/cicada-git"
}