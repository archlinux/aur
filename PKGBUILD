# Maintainer: Michael Gwin <oksijun+arch at gmail dot com>

pkgname=python-netutils-linux-git
_gitname=netutils-linux
pkgver=2.5.0.r4.g3d5c0ea
pkgrel=1
pkgdesc="A suite of utilities simplilfying linux networking stack performance troubleshooting and tuning"
url="https://github.com/strizhechenko/netutils-linux"
depends=('python-yaml' 'python-ipaddress' 'python-six' 'python-colorama' 'python-prettytable' 'python-argparse')
makedepends=('git' 'python-distribute')
conflicts=('python-netutils-linux')
provides=('python-netutils-linux')
license=('MIT')
arch=('any')
source=(git+https://github.com/strizhechenko/netutils-linux.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/$_gitname"
  python setup.py install --root="$pkgdir/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
