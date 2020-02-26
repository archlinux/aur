# Maintainer: Pieter Lenaerts <pieter dot aj dot lenaerts gmail>

pkgname=jpegdupes
pkgver=2.0.13
pkgrel=2
pkgdesc='Image duplicate finder that ignores JPEG metadata'
arch=('any')
url='https://github.com/jesjimher/imgdupes'
depends=('libgexiv2' 'python-texttable' 'python-jpegtran-cffi' 'python-pillow' 'python-gobject')
optdepends=('jpeginfo: smarter JPEG file integrity detection')
conflicts=('jpegdupes-git' 'imgdupes' 'imgdupes-git')
license=('GPL3')
source=("https://files.pythonhosted.org/packages/d7/bc/a80d5f90fa1ca5b2188b90f3addcf853c420897f8b8db854addace7e34ee/$pkgname-$pkgver.tar.gz")
sha512sums=('775ad11738a5a9eea3eefe66e5c947ffe1995ce57339b3d9bda019bc854a2ef4da8d5fa7501ac21872aa7d51118b0788f89c3280f7e602d7f59339e7ae176536')

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
