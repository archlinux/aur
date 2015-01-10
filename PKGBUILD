# Maintainer: Borja Ruiz <borja [at] libcrack [dot] so>
pkgname=python2-pwntools
pkgver=2.2.r49.g7d964f8
pkgrel=1
pkgdesc="The CTF framework used by Gallopsled in every CTF."
arch=('any')
url="https://github.com/Gallopsled/pwntools/"
license=('MIT' 'GPL2' 'BSD')
makedepends=('lib32-glibc')
depends=('python2>=2.7' 'python2-mako' 'python2-paramiko')
provides=('python2-pwntools')
conflicts=('python2-pwntools')
replaces=('python2-pwntools')
backup=()
options=(!emptydirs)
source=("$pkgname"::'git+https://github.com/Gallopsled/pwntools.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m 644 LICENSE-pwntools.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
