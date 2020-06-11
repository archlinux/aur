# Maintainer: Mike Javorski (javmorin) <mike.javorski@gmail.com>
# Contributor: Aaron Miller <aaronm@cldtk.com>

pkgname=aws-sam-cli
pkgver=0.52.0
pkgrel=1
pkgdesc='CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM'
arch=('any')
url='https://github.com/awslabs/aws-sam-cli'
license=('Apache')
depends=('docker' 'python-click' 'python-flask' 'python-boto3' 'python-jmespath' 'python-yaml' 'python-cookiecutter'
         'python-aws-sam-translator' 'python-docker' 'python-dateparser' 'python-dateutil' 'python-requests'
         'python-serverlessrepo' 'python-aws_lambda_builders' 'python-tomlkit')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('57e954e9dced9c53e69f92e6f6dbae26845c9b5f211cee0bee5b0997cf6b23cf')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}
