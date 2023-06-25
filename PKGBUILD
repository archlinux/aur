# Maintainer: brokenpip3 <brokenpip3[at]gmail[dot]com>
# https://github.com/brokenpip3/my-pkgbuilds

pkgname=try
pkgver=0.1.0
pkgrel=1
pkgdesc="Try lets you run a command and inspect its effects before changing your live system"
arch=('any')
url="https://github.com/binpash/try"
license=('MIT')
depends=('bash')
provides=('try')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('096214cdaf6c085ae9105d4140f00fbc01e8f99d834c4be7d607166318aba48a66e3a6055b2943b1ffe399f6b756638004ef814c41067cbe1b5aaab5e4fc4aeb')

#create man page
# Pandoc-cli require too many packages as dependecy
#prepare() {
#    #make -C man try.1
#}

check() {
    $srcdir/$pkgname-$pkgver/test/run_tests.sh
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 completions/${pkgname}.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    #install -Dm644 man/${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
