# Maintainer: Mike Javorski (javmorin) <mike.javorski@gmail.com>
# Contributor: Aaron Miller <aaronm@cldtk.com>

pkgname=aws-sam-cli
pkgver=1.95.0
pkgrel=1
pkgdesc='CLI tool to build, test, debug, and deploy Serverless applications using AWS SAM'
arch=('any')
url='https://github.com/aws/aws-sam-cli'
license=('Apache')
depends=('docker' 'python-aws-lambda-builders' 'python-aws-sam-translator' 'python-boto3' 'python-cfn-lint'
         'python-chevron' 'python-click' 'python-cookiecutter' 'python-dateparser' 'python-docker' 'python-flask'
         'python-jmespath' 'python-pyopenssl' 'python-requests' 'python-rich' 'python-ruamel-yaml'
         'python-tomlkit' 'python-typing-extensions' 'python-watchdog' 'python-yaml')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('5712ee27a72a32d52df09fd4a86adaf7ad4aa3d567ef99aa1ea181163659553a')

package() {
  cd "$pkgname-$pkgver"

  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}
