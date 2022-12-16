# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

pkgname=python-tld-git
_realname=tld
pkgver=0.12.7
pkgrel=1
pkgdesc="Extracts the top level domain (TLD) from the URL given"
arch=('any')
url="https://github.com/barseghyanartur/tld"
license=('GPL')
depends=('python' 'python-six')
makedepends=('python-setuptools' 'git')
options=(!emptydirs)
source=("git+https://github.com/barseghyanartur/$_realname.git")
sha256sums=('SKIP')
provides=('python-tld')
conflicts=('python-tld')

pkgver() {
	cd "$srcdir/$_realname"
	cat setup.py | grep 'version = ' | tr '"' ' ' | awk '{print $3}'
}

package() {
  cd "$srcdir/$_realname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
