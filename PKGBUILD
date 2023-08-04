# Maintainer: Pieter Lenaerts <pieter dot aj dot lenaerts gmail>

pkgname=jpegdupes
pkgver=2.1.0
pkgrel=1
pkgdesc='Image duplicate finder that ignores JPEG metadata'
arch=('any')
url='https://github.com/jesjimher/imgdupes'
depends=('libgexiv2' 'python-texttable' 'python-jpegtran-cffi' 'python-pillow' 'python-gobject')
optdepends=('jpeginfo: smarter JPEG file integrity detection')
conflicts=('jpegdupes-git' 'imgdupes' 'imgdupes-git')
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")

#prepare() {
#	patch "${srcdir}/imgdupes-${pkgver}/imgdupes.py" << EOF
#1c1
#< #!/usr/bin/python
#---
#> #!/usr/bin/python2
#EOF
#}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
sha512sums=('2ca9ea50fcb046f39e97b59532c2949ed6e0e8994eac035bf3010533d82577c9f961a420f1efb4ec7c5ec3cbbb6467cc11ced91576fc7181267467d84ab81fdf')
