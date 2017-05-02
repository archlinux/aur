# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=azure-cli
pkgname=python-$_name
pkgver=2.0.4
pkgrel=1
pkgdesc="Microsoft Azure Command-Line Tools"
arch=('any')
url="https://github.com/Azure/azure-cli"
license=('MIT')
depends=('python-azure-cli-acr' 'python-azure-cli-acs'
         'python-azure-cli-appservice'
         'python-azure-cli-batch' 'python-azure-cli-cloud'
         'python-azure-cli-component' 'python-azure-cli-configure'
         'python-azure-cli-container' 'python-azure-cli-documentdb'
         'python-azure-cli-find' 'python-azure-cli-iot'
         'python-azure-cli-keyvault' 'python-azure-cli-lab'
         'python-azure-cli-monitor' 'python-azure-cli-network'
         'python-azure-cli-profile' 'python-azure-cli-redis'
         'python-azure-cli-resource' 'python-azure-cli-role'
         'python-azure-cli-sql' 'python-azure-cli-storage'
         'python-azure-cli-vm')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('b0274bbc4f05bfdcfbcbec6bbeb98210')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/__init__.py
  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/__pycache__/__init__.*
  
  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/cli/__init__.py
  rm "$pkgdir"/usr/lib/python3.?/site-packages/azure/cli/__pycache__/__init__.*
}
