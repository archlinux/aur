# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli
pkgname=python-$_name
pkgver=2.20.0
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
sha256sums=('35416e94ab39375dd8a23229285615a4937dd56b43bf0307aabb9621c80b0b0e')

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
