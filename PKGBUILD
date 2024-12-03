# Maintainer: Maxim Novikov <the.mlex@gmail.com>
pkgname=zephir
pkgver=0.18.0
pkgrel=1
pkgdesc="Zephir is a compiled high level language aimed to the creation of C-extensions for PHP http://zephir-lang.com/"
url="https://github.com/zephir-lang/zephir"
arch=('x86_64' 'i686')
license=('MIT')
depends=('php-zephir-parser' 'php')

if [[ $CARCH = "i686" ]]; then
  makedepends+=('lib32-pcre');
fi

source=(
	"https://github.com/zephir-lang/zephir/releases/download/${pkgver}/zephir.phar"
)

sha256sums=('e2ebe572fbb2de2975153452836e0a5f80a82cafa38f392baa687d8ba458877b')

package() {
  ZEPHIRDIR=/opt/$pkgname

  install -d $pkgdir/{$ZEPHIRDIR,usr/bin}

  install -Dm777 zephir.phar "$pkgdir"/opt/zephir/zephir

  ln -s /opt/zephir/zephir $pkgdir/usr/bin/zephir
}
