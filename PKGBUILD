# Maintainer: Corentin Peuvrel <corentin.peuvrel at gmail dot com>
pkgname=usleep
pkgver=1.0
pkgrel=1
pkgdesc="A simple C wrapper of glibc's function"
arch=(x86_64)
url=http://linux.die.net/man/3/usleep
license=('MIT')
depends=('glibc')
source=("usleep.c" "Makefile" "LICENSE")
md5sums=('6da0cbdc5a41ad656fd843703936e636'
         '2dcf21a9a6c4ef67e4e3edcbed189289'
         '51766e6e3cd7960da32876585fe6aecd')

build() {
  make
}

package() {
  make PREFIX="$pkgdir/usr/bin" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
