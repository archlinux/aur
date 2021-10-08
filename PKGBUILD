# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=aws-cfn-template-flip
pkgver=1.3.0
pkgrel=1
pkgdesc="Tool for converting AWS CloudFormation templates between JSON and YAML formats."
url="https://github.com/awslabs/aws-cfn-template-flip"
license=('BSD')

source=("$url/archive/${pkgver}.tar.gz")
sha256sums=('80ba7631f7689e1116879fbf073c56f1848fa73b344fb23e27d0e393237b433d')
depends=('python-click' 'python-yaml')
makedepends=('python-distribute')
arch=('any')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
}
