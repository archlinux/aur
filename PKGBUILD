# Maintainer: Vivien Maisonneuve <v dot maisonneuve at gmail dot com>
pkgname='dotploy-git'
pkgver=0.1.0.r25.g066bc59
pkgrel=1
pkgdesc='Deploy dotfiles using symlinks'
arch=('any')
license=('LGPL')
provides=("dotploy=$pkgver")
conflicts=('dotploy')
depends=('python' 'python-click' 'python-logbook' 'python-ruamel-yaml' 'python-setuptools')
makedepends=('git')
source=('dotploy::git+https://gitlab.com/vmaison/dotploy.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/dotploy"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/dotploy"
    python setup.py install --root="$pkgdir/" --optimize=1
}
