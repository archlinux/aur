# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=aws-cfn-template-flip
pkgver=1.2.2
pkgrel=1
pkgdesc="Tool for converting AWS CloudFormation templates between JSON and YAML formats."
url="https://github.com/awslabs/aws-cfn-template-flip"
license=('BSD')

source=("$url/archive/${pkgver}.tar.gz")
sha256sums=('c2780f27b74bd14222d19dd82b2b60ca6451c91e5a5ea963758b085bf9dde9ea')
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
