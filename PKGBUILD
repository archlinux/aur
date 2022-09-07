# Contributor: Ethan Zonca <e@ethanzonca.com>

pkgname='borgweb-git'
pkgdesc='Web front-end for Borg'
pkgver=0.3.0.r8.ge609ec4
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/borgbackup/borgweb'
depends=('python-flask')
makedepends=('git' 'python-setuptools-scm' 'npm')

source=('git+https://github.com/borgbackup/borgweb.git')
sha512sums=('SKIP')


package() {
  cd "${srcdir}/borgweb"

  python setup.py install --root="$pkgdir/" --optimize=1

  cd js
  npm install

}


pkgver() {
  cd "$srcdir/borgweb"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

