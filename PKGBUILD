# Maintainer: Christian Hesse <arch@eworm.de>
# Contributor: zhangjoto
# Contributor: Vsevolod Balashov <vsevolod@balashov.name>

pkgname=libkeepalive
pkgver=0.3
pkgrel=1
pkgdesc='Enable tcp keepalive features without change in the original program'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/libkeepalive/'
license=('GPL')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fb577b132a49d289ff3cd0c2a670ddc50028c6dbecfb164958ac031376a82dd2')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -D -m0755 libkeepalive.so "${pkgdir}"/usr/lib/libkeepalive.so
}
