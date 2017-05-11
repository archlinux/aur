# Maintainer: tjbp (archlinux@tjbp.net)

pkgname='phptrace-cli'
pkgver='1.0.1beta'
pkgrel='1'
pkgdesc='A tracing and troubleshooting tool for PHP scripts'
arch=('i686' 'x86_64')
url='https://pecl.php.net/package/trace'
license=('Apache')
depends=('php-trace')
source=("http://pecl.php.net/get/trace-$pkgver.tgz")
sha256sums=('82d50603cd8bc1142e42e3baa9a2f75253ef157fed170d543e7be4ad214aa4e6')

build() {
    pushd "$srcdir/trace-$pkgver/extension"
    phpize
    ./configure
    make cli
    popd
}

package() {
    pushd "$srcdir/trace-$pkgver/src"
    install -Dm755 phptrace "$pkgdir/usr/bin/phptrace"
    popd
}
