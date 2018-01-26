# Submitter: Michael Spradling <mike@mspradling.com>

pkgname='passhole'
pkgver=r69.5f561f6
pkgrel=1
pkgdesc='KeePass CLI + dmenu interface'
arch=('any')
makedepends=('python-setuptools')
depends=("python-future" "python-future" "python-pykeepass" "python-pygpgme" "python-colorama" "python-pyuserinput-git" "python-easypysmb")
source=("git+https://github.com/purdueLUG/passhole.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/passhole"
  python setup.py install --root="$pkgdir/" --optimize=1
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
