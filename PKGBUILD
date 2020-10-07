# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli
pkgname=python-$_name
pkgver=2.12.1
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('fabric' 'python-antlr4' 'python-applicationinsights' 'python-argcomplete'
         'python-azure-git' 'python-azure-multiapi-storage' 'python-colorama'
         'python-humanfriendly' 'python-jmespath' 'python-knack' 'python-pkginfo'
         'python-pyopenssl' 'python-pytz' 'python-scp' 'python-sshtunnel'
         'python-tabulate' 'python-vsts-cd-manager' 'python-wheel' 'python-yaml')
makedepends=('git' 'python-setuptools')
source=("https://github.com/Azure/azure-cli/archive/azure-cli-${pkgver}.tar.gz")
sha256sums=('6332a7cb47d5d2a3f771bb4b80a093bcbd69bf22540f801a2dbcfdcbddc76a25')

build() {
  cd "$_name-$_name-$pkgver/src"

  for d in azure-cli azure-cli-core
  do cd $d;
     python setup.py build;
     cd -;
  done;
}

package() {
  cd "$_name-$_name-$pkgver/src"

  for d in azure-cli azure-cli-core
  do cd $d;
     python setup.py install --root="$pkgdir" --optimize=1
     cd -;
  done;
}
