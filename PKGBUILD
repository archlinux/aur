# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='phptrace-cli'
pkgver='0.3.0'
pkgrel='1'
pkgdesc='A tracing and troubleshooting tool for PHP scripts'
arch=('i686' 'x86_64')
url='https://pecl.php.net/package/trace'
license=('Apache')
depends=('php-trace')
source=("http://pecl.php.net/get/trace-$pkgver.tgz")
sha256sums=('aa5f6a91a77ef11f4102b542847b32fce03ea7777081ebb86a812228526b38f7')

build() {
    pushd "$srcdir/trace-$pkgver/cmdtool"
    make
    popd
}

package() {
    pushd "$srcdir/trace-$pkgver/cmdtool"
    install -Dm755 phptrace "$pkgdir/usr/bin/phptrace"
    install -Dm755 trace-php "$pkgdir/usr/bin/trace-php"
    popd
}
