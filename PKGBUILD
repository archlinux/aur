# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=python2-pwntools
pkgver=2.2.0
pkgrel=1
pkgdesc="The CTF framework used by Gallopsled in every CTF."
arch=('any')
url="https://github.com/Gallopsled/pwntools/"
license=('MIT' 'GPL2' 'BSD')
makedepends=('lib32-glibc')
depends=('python2>=2.7' 'python2-mako' 'python2-paramiko')
conflicts=('python2-pwntools', 'python2-pwntools-git')
options=('strip')
source=("https://github.com/Gallopsled/pwntools/archive/${pkgver}.tar.gz")
md5sums=('3ab358401ec751436f71633fb7476c28')

_repodir="pwntools-$pkgver"

package() {
  cd "$srcdir/$_repodir"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m 644 LICENSE-pwntools.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
