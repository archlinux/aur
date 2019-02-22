# Maintainer: Arvedui <arvedui@posteo.de>

pkgname=ansible-merge-vars
pkgver=4.0.0
pkgrel=1
pkgdesc="An Ansible action plugin to explicitly merge inventory variables"
url="https://github.com/leapfrogonline/ansible-merge-vars"
makedepends=('python' 'python-setuptools')
depends=('ansible')
license=('Apache')
arch=('any')
source=("${pkgname}-${pkgname}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8934304fd9bb1905d503d616c71d83ceef3688fc5c79055a0eab9d032f6d1759')

build(){
  cd "$srcdir/ansible-merge-vars-$pkgver"
  python setup.py build
}

package(){

    cd "$srcdir/ansible-merge-vars-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
