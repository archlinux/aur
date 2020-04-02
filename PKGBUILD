# Maintainer: Michael M. Tung <mtung at mat dot upv dot es>

pkgname=sidenote
pkgver=0.1.1
pkgrel=1

pkgdesc='A command line utility for managing plain text notes.'
arch=('x86_64')
url='https://github.com/ryot4/sidenote'
license=('MIT')
source=("$pkgname-$pkgver.tgz::https://github.com/ryot4/sidenote/archive/v${pkgver}.tar.gz")

makedepends=('go')

build() {
  cd "$srcdir/sidenote-${pkgver}"
  go build ./
}

package() {
	cd "$srcdir"
	install -D -m644 "${srcdir}/sidenote-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -s -m755 "${srcdir}/sidenote-${pkgver}/sidenote" "${pkgdir}/usr/bin/sidenote"
}

md5sums=('f177c13f2845e6af2462c665c2593855')
