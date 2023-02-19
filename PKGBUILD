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
source=("https://www.python.org/ftp/python/doc/$pkgver/python-$pkgver-docs-html.tar.bz2")
sha256sums=('20445e9a571cacdd350f702f0980e4dc559b6ff81f1d69affe9b0a862fef2f0e')

package() {
  mkdir -p "$pkgdir"/usr/share/doc/python2/html
  cp -rf "$srcdir"/python-$pkgver-docs-html/* "$pkgdir"/usr/share/doc/python2/html/
  find "$pkgdir"/usr/share/doc/python2/html/ -type f -exec chmod 0644 {} \;
  find "$pkgdir"/usr/share/doc/python2/html/ -type d -exec chmod 0755 {} \;
}
