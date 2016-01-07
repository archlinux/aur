# Maintainer: Gore Liu <goreliu@126.com>
# Contributor: codestation <codestation404 at gmail dot com>

pkgname=prll
pkgver=0.6.2
pkgrel=1
pkgdesc="A utility for parallelizing execution in bash or zsh"
arch=('i686' 'x86_64')
url="https://gitorious.org/prll"
license=('GPL')

source=(http://downloads.sourceforge.net/sourceforge/prll/$pkgname-$pkgver.tar.bz2)

md5sums=('b62cf29faf9031b288f7f9871bb9c33b')

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  make
}

package() {
  install -D -m755 "${srcdir}/$pkgname-$pkgver/${pkgname}_qer" "${pkgdir}/usr/bin/${pkgname}_qer"
  install -D -m755 "${srcdir}/$pkgname-$pkgver/${pkgname}_bfr" "${pkgdir}/usr/bin/${pkgname}_bfr"
  install -D -m755 "${srcdir}/$pkgname-$pkgver/$pkgname.sh" "${pkgdir}/etc/profile.d/$pkgname.sh"
  install -D -m644 "${srcdir}/$pkgname-$pkgver/AUTHORS" "${pkgdir}/usr/share/doc/$pkgname/AUTHORS"
  install -D -m644 "${srcdir}/$pkgname-$pkgver/README" "${pkgdir}/usr/share/doc/$pkgname/README"
  install -D -m644 "${srcdir}/$pkgname-$pkgver/NEWS" "${pkgdir}/usr/share/doc/$pkgname/NEWS"
  install -D -m644 "${srcdir}/$pkgname-$pkgver/COPYING" "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}
