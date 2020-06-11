# Maintainer: Mike Javorski (javmorin) <mike.javorski gmail com>
pkgname=python-serverlessrepo
_name=${pkgname#python-}
pkgver=0.1.10
pkgrel=1
pkgdesc='A Python library with convenience helpers for working with the AWS Serverless Application Repository.'
arch=('any')
url="https://github.com/awslabs/aws-serverlessrepo-python"
license=('Apache')
depends=('python-yaml' 'python-boto3' 'python-six')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('671f48038123f121437b717ed51f253a55775590f00fbab6fbc6a01f8d05c017')

package() {
  cd "$srcdir/$_name-$pkgver"

  # setup is current configured set to install tests, so remove them beforehand
  rm -fr tests

  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}
