# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=apache-html-manual
_pkgname=httpd
pkgver=2.4.10
pkgrel=1
pkgdesc='Apache manual html pages'
arch=('any')
options=('libtool' '!strip' '!zipman' '!purge' 'docs')
url='http://www.apache.org/dist/httpd'
license=('APACHE')
source=(
http://www.apache.org/dist/httpd/httpd-${pkgver}.tar.bz2
http://www.apache.org/dist/httpd/httpd-${pkgver}.tar.bz2.asc
)
sha256sums=('176c4dac1a745f07b7b91e7f4fd48f9c48049fa6f088efe758d61d9738669c6a'
            'SKIP')
options=('emptydirs')

package() {
  cd "$srcdir"/${_pkgname}-$pkgver
  
  install -d "$pkgdir"/usr/share/$_pkgname
	cp -a "$srcdir"/httpd-$pkgver/docs/manual \
    "$pkgdir"/usr/share/$_pkgname/
}
