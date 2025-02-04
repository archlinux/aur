# Pimper : robertfoster

pkgname=rapid-spring-git
pkgver=233.df54975
pkgrel=1
pkgdesc="Commandline client for Spring rapid downloading system"
arch=('i686' 'x86_64')
url="http://github.com/tvo/rapid/"
license=('GPL')
depends=('python2-bitarray' 'python2' 'spring' 'python-pip' 'python2-cx_freeze')
source=("rapid::git+https://github.com/tvo/rapid.git"
  'patch')

package() {
  cd rapid
  patch -Np0 -i ../patch
  python2 setup.py install --root=$pkgdir

}

pkgver() {
  cd rapid
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

sha256sums=('SKIP'
  '600939d493c7a346eca0dfc37f9ef354099112af36fbd27b0ea168b1a87eeb69')
