# Maintainer: Mike Javorski (javmorin) <mike.javorski@gmail.com>
# Contributor: Aaron Miller <aaronm@cldtk.com>

pkgname=aws-sam-cli
pkgver=1.74.0
pkgrel=1
pkgdesc='CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM'
arch=('any')
url='https://github.com/aws/aws-sam-cli'
license=('Apache')
depends=('docker' 'python-chevron' 'python-click' 'python-flask' 'python-boto3' 'python-jmespath' 'python-yaml'
         'python-cookiecutter' 'python-aws-sam-translator' 'python-docker' 'python-dateparser'
         'python-requests' 'python-serverlessrepo' 'python-aws-lambda-builders' 'python-tomlkit' 'python-watchdog'
         'python-typing-extensions' 'python-pyopenssl' 'python-ruamel-yaml' 'python-cfn-lint')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('86e77f74d0b3d2b7057e58020a090832c8757d8e1cd34ab2968144d571fb500b')

package() {
  cd "$pkgname-$pkgver"

  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}
