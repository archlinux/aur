# Maintainer: Ethan Zonca <e@ethanzonca.com>

pkgname='borgweb-git'
pkgdesc='Web front-end for Borg'
pkgver=0.1.4.r59.ga9e694d
pkgrel=1
arch=('i686' 'x86_64')
url='https://github.com/borgbackup/borgweb'
depends=('python' 'python-tox' 'python-pytest' 'python-click' 'python-itsdangerous' 'python-werkzeug' 'python-flask' 'npm')
makedepends=('python-pip')

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

