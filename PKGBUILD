# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=apache-html-manual
_pkgname=httpd
pkgver=2.4.43
pkgrel=1
pkgdesc='Apache manual html pages'
arch=('any')
options=('libtool' '!strip' '!zipman' '!purge' 'docs')
url='http://www.apache.org/dist/httpd'
license=('APACHE')
source=(
http://www.apache.org/dist/httpd/httpd-${pkgver}.tar.bz2
)
sha256sums=('a497652ab3fc81318cdc2a203090a999150d86461acff97c1065dc910fe10f43')
options=('emptydirs')

package() {
  cd "$srcdir"/${_pkgname}-$pkgver
  
  install -d "$pkgdir"/usr/share/$_pkgname
	cp -a "$srcdir"/httpd-$pkgver/docs/manual \
    "$pkgdir"/usr/share/$_pkgname/
}
