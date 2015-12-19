# Maintainer: Slithery <aur at slithery dot uk>
pkgname=python-py3sensors-hg
pkgver=r15.0cf96f4e2cfe
pkgrel=1
pkgdesc=('Python bindings for libsensors.so from the lm-sensors project')
arch=('any')
url=('https://bitbucket.org/gleb_zhulik/py3sensors')
license=('GPL')
depends=('python' 'lm_sensors')
makedepends=('mercurial')
provides=('python-py3sensors')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("$pkgname"::hg+"$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
