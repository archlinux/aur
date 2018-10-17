# Maintainer: Edoardo Morassutto <edoardo.morassutto@gmail.com>

pkgname=cmsbooklet-git
pkgver=r86.b8f3cc6
pkgrel=1
pkgdesc="cmsbooklet is a tool meant to facilitate the typesetting of olympic problems. It is designed to work well with CMS, the Contest Management System."
arch=('any')
url="https://github.com/algorithm-ninja/cmsbooklet"
license=('AGPL3')
depends=('python' 'python-jinja' 'python-pyaml')
makedepends=('python2-setuptools')
source=("git+https://github.com/algorithm-ninja/cmsbooklet.git")
sha384sums=('SKIP')

pkgver() {
    cd "$srcdir/cmsbooklet"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/cmsbooklet"
    python setup.py install --root="$pkgdir/" --optimize=1
}

