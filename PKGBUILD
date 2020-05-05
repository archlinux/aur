# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-asciichart
pkgver=1.5.12
pkgrel=1
pkgdesc="Nice-looking lightweight console ASCII line charts ╭┈╯"
arch=('x86_64')
url="https://github.com/kroitor/asciichart"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
checkdepends=('python-pytest')

source=("https://github.com/kroitor/asciichart/archive/v${pkgver}.tar.gz")
md5sums=('d10a6b1bae5652e15586e42b5462cfdc')

check() {
  cd asciichart-${pkgver}
  python test.py
}

package() {
  cd asciichart-${pkgver}
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
