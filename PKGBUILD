# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Yuri D. Lenskiy <yuri.lenskiy@gmail.com>

_pkgname=rpass
pkgname=rpass-git
pkgver=r7.3001b45
pkgrel=1
pkgdesc="GPG-based, secure, pluggable, encrypted, and simple commandline password manager."
arch=('any')
url="https://github.com/rscare/rpass"
license=('GPL')
depends=('python' 'gnupg' 'procps' 'gpgme')
optdepends=('xclip: allows automatic copying of passwords to avoid all writing to stdout- HIGHLY RECOMMENDED'
            'gnupg2: includes gpg-agent - HIGHLY RECOMMENDED'
            'dmenu: for gui utilities')
makedepends=('git')
source=("git://github.com/rscare/rpass.git")
md5sums=('SKIP')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname/python_interface"

  python setup.py install --prefix="/usr" --root="$pkgdir/"
}
