# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon 'ALSimon' Gilliot <simon@gilliot.fr>
# Contributor: Olivier Biesmans <olivier at biesmans dot fr>

pkgname=mitmproxy
pkgver=0.14
pkgrel=1
pkgdesc="SSL-capable man-in-the-middle HTTP proxy"
arch=('any')
url="http://mitmproxy.org/"
license=('GPL')
depends=('python2-netlib' 'python2-pyasn1' 'python2-pyparsing' 
         'python2-configargparse' 'python2-tornado'
         'python2-pyperclip' 'python2-blinker' 'python2-setuptools'
         'python2-urwid' 'python2-lxml' 'python2-pillow'
         'python2-html2text' 'python2-construct' 'python2-click')
optdepends=('python2-pyamf: Contentviews - Decodes AMF files'
            'python2-protobuf: Contentviews - Extended content decoding'
            'python2-cssutils: Contentviews - Beautifies CSS files')
makedepends=('git')
checkdepends=('python2-nose' 'pathod' 'python2-mock')
provides=('python2-libmproxy')
source=("git+https://github.com/mitmproxy/mitmproxy.git#tag=v$pkgver")
sha256sums=('SKIP')

check() {
  cd "$srcdir/$pkgname"
  nosetests2
}
 
package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir" -O1
}
