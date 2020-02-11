# Maintainer: Tim Liou <wheatdoge at gmail dot com>
pkgname=i3-workspace-groups
pkgver=0.4.6
pkgrel=1
pkgdesc='Manage i3wm workspaces in groups you control'
url='https://github.com/infokiller/i3-workspace-groups'
arch=('any')
license=('MIT')
source=("git+https://github.com/infokiller/i3-workspace-groups#tag=$pkgver")
sha256sums=('SKIP')
depends=('python' 'i3-wm' 'python-i3ipc')
makedepends=('python-setuptools' 'git')
install="${pkgname}.install"

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
