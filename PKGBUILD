# Maintainer: Borja Ruiz <borja [at] libcrack [dot] so>
pkgname=python2-pwntools
pkgver=2.1.1.r18.g528e2db
pkgrel=1
pkgdesc="CTF framework used by Gallopsled in every CTF"
arch=('any')
url="https://github.com/Gallopsled/pwntools/"
license=('Mostly MIT, some GPL/BSD')
groups=()
#depends=('python2>=2.7' 'python2-pip' 'python2-mako' 'python2-paramiko')
depends=('python2>=2.7' 'python2-mako' 'python2-paramiko')
#aur/python26-argparse
makedepends=()
provides=('python2-pwntools')
conflicts=('python2-pwntools')
replaces=('python2-pwntools')
backup=()
options=(!emptydirs)
install=
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

# vim:set ts=2 sw=2 et:
