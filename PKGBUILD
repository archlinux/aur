# Maintainer: Vivien Maisonneuve <v dot maisonneuve at gmail dot com>
pkgname='dotploy-git'
pkgver=0.1.0.r1.ga668677
pkgrel=2
pkgdesc='Deploy dotfiles using symlinks'
arch=('any')
license=('LGPL')
provides=("dotploy=$pkgver")
conflicts=('dotploy')
depends=('python' 'python-click' 'python-logbook' 'python-ruamel-yaml' 'python-setuptools')
makedepends=('git')
source=('dotploy::git+https://github.com/vivienm/dotploy.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/dotploy"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/dotploy"
    python setup.py install --root="$pkgdir/" --optimize=1
}
