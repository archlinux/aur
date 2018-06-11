# Maintainer: Aaron Miller <aaronm@cldtk.com>

pkgname=aws-sam-cli
pkgver=0.3.0
pkgrel=1
pkgdesc='CLI tool for local development and testing of Serverless applications'
arch=('any')
url='https://github.com/awslabs/aws-sam-cli'
license=('Apache')
depends=('python')
source=("https://github.com/awslabs/aws-sam-cli/archive/v${pkgver}.tar.gz")
sha256sums=('227c8c9a4ad565cee58496008aa07f6ee15336b523336f9a2b404f71a0cd4b0f')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
