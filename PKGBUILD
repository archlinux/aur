# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>
pkgname=python2-regex
pkgver=0.1.20141024
pkgrel=1
pkgdesc="Alternative regular expression module, to replace re."
arch=('i686' 'x86_64')
url="https://bitbucket.org/mrabarnett/mrab-regex"
license=('custom')
depends=('python2')
makedepends=('python2-distribute')
conflicts=('python2-regex-hg')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/python-regex_${pkgver}.orig.tar.gz")
sha256sums=('8bd2dbf096bcfa881bd7e06093037037a7315e82d0e74441338f4b6492037801')

build() {
  cd "$srcdir/regex-2014.10.24"

  python2 setup.py build
}

package() {
  cd "${srcdir}/regex-2014.10.24"

  python2 setup.py install --prefix=/usr --root="${pkgdir}"
}

