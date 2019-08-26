# Maintainer: Manuel Palenzuela <sadshinobi@protonmail.com>

pkgname=jrnl-git
_gitname=jrnl
pkgver=0
pkgrel=1
pkgdesc="A simple command line journal application that stores your journal in a plain text file"
arch=('any')
url="https://jrnl.sh/"
license=('MIT')
depends=('python-asteval' 'python-dateutil' 'python-keyring' 'python-keyrings-alt' 'python-parsedatetime' \
         'python-pytz' 'python-tzlocal' 'python-pyaml' 'python-six' 'python-passlib' 'python-xdg' 'python-cryptography')
makedepends=('git')
conflicts=("jrnl")
source=("git+https://github.com/maebert/jrnl.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf '0.r%s.%s' \
      "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
