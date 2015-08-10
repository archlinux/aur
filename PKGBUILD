# Maintainer: Lars HagstrÃ¶m <lars@foldspace.nu>
pkgname=python-pyharmony-git
pkgver=r20.1b20822
pkgrel=1
pkgdesc="Python library for connecting to and controlling the Logitech Harmony Link"
arch=('any')
url="https://github.com/DonOregano/pyharmony"
license=('BSD')
groups=()
depends=('python-sleekxmpp')
makedepends=('git' 'python-setuptools')
options=(!emptydirs)
install=
source=("$pkgname"::"git+https://github.com/DonOregano/pyharmony.git")
sha1sums=('SKIP')
backup=()

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

