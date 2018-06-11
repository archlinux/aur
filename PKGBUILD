# Maintainer: Aaron Miller <aaronm@cldtk.com>

pkgname=python-aws-sam-translator
_name=${pkgname#python-}
pkgver=1.5.4
pkgrel=1
pkgdesc='AWS SAM Translator is a python library that transform SAM templates into AWS CloudFormation templates'
arch=('any')
url='https://pypi.org/project/aws-sam-translator/'
license=('Apache')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('9d8a25e058c78d2cef5c07aec7f98cbc2070dbfc2eb6a2e102a16beafd14e3ca')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
