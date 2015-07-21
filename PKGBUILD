# Maintainer: XIE Yuheng <xyheme@gmail.com>

pkgname=cicada
pkgver=2015.06.24
pkgrel=1
pkgdesc="programming language with the following features
1. threaded code based
2. aggressively developed
3. never provide backward compatibility
[github zip version]"
url="http://cicada-language.github.io/"
makedepends=('')
depends=('fasm-linux-git')
license=('custom')
arch=('any')
source=('https://github.com/cicada-language/cicada/archive/master.zip')
provides=('cicada')
conflicts=('cicada-git')
md5sums=('SKIP')
install=cicada.install

build() {
  cd "$srcdir/cicada-master"
  make build
}

package() {
  cd "$srcdir/cicada-master"
  make PREFIX="$pkgdir/usr" install
  install -D -m644 LICENSE/LICENSE-of-cicada -t "${pkgdir}/usr/share/licenses/cicada"
}