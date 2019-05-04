# Maintainer: Thomas Heilberg <thomas at thomas42 dot net>

pkgname=mackup-git
pkgver=0.8.24
pkgrel=1
pkgdesc="a small Python utitlity to keep your application settings in sync."
arch=('any')
url="https://github.com/lra/mackup"
license=('GPL3')

depends=('python' 'python-docopt')
makedepends=('python' 'python-setuptools')
provides=('mackup')
conflicts=('mackup')

source=("git+https://github.com/lra/mackup.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --always --tags | sed 's|-|.|g'
}

package() {
    cd "${pkgname%-git}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
