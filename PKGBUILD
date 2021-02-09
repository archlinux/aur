# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli
pkgname=python-$_name
pkgver=2.19.0
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
sha256sums=('c82aa53d85e9d14640e3f26a8911af74b213d1dbe847120e2b92335544ae1c29')

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
