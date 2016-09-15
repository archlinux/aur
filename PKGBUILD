# Maintainer: Arthur Vuillard <arthur@hashbang.fr>

name=watchghost
pkgname=$name-git
pkgver=0.1.0.git_99.0005a9e
pkgrel=1
pkgdesc="Your invisible but loud monitoring pet"
arch=('any')
url='https://gitlab.com/localg-host/watchghost/'
license=('AGPLv3')
depends=('python-tornado' 'python-aioftp')
makedepends=('python-setuptools')
source=('git+https://gitlab.com/localg-host/watchghost.git')

pkgver(){
    cd $srcdir/$name

    echo 0.1.0.git_$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "$srcdir/$name"
    python3 setup.py build
    python3 setup.py install --prefix=/usr --root="${pkgdir}"
}

sha256sums=('SKIP')

