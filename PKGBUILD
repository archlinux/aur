# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor : Rohan Dhruva (rohandhruva at gmail dot com)

pkgname=python2-docs
pkgver=2.7.18
pkgrel=1
pkgdesc="Set of HTML documentation for python."
arch=('any')
url="https://docs.python.org/"
license=('GPL')
install=python2-docs.install
options=('docs')
source=(https://docs.python.org/ftp/python/doc/$pkgver/python-$pkgver-docs-html.tar.bz2)
sha512sums=('db39390577ec86f13c9b6b57c01cba36fe9fd89092a773dc94f1a6a19d912759d097c4d80e765d3657b572abc731c1da9e7b4cd4c38065cd444606b906744abe')

package() {
  mkdir -p "$pkgdir"/usr/share/doc/python2/html
  cp -rf "$srcdir"/python-$pkgver-docs-html/* "$pkgdir"/usr/share/doc/python2/html/
  find "$pkgdir"/usr/share/doc/python2/html/ -type f -exec chmod 0644 {} \;
  find "$pkgdir"/usr/share/doc/python2/html/ -type d -exec chmod 0755 {} \;
}
