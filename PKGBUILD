# Maintainer: Georgiy Tugai <georgiy.tugai@gmail.com>
# Maintainer: ssfdust <ssfdust@gmail.com>
pkgname=lieer-git
pkgver=v1.3.r25.a4ab209
pkgrel=1
pkgdesc="Fast fetch and two-way tag synchronization between notmuch and GMail"
arch=(any)
url="https://github.com/gauteh/lieer"
license=('GPL3')
groups=()
depends=('python' 'python-tqdm' 'python-google-api-python-client' 'python-oauth2client' 'notmuch>=0.25')
makedepends=('git' 'python-setuptools')
optdepends=()
provides=("${pkgname%-git}" "gmai${pkgname%-git}" "gmai${pkgname}")
conflicts=("${pkgname%-git}" "gmai${pkgname%-git}" "gmai${pkgname}")
replaces=()
backup=()
options=(!emptydirs)
install=
changelog=
source=("$pkgname::git+https://github.com/gauteh/lieer.git")
md5sums=('SKIP')
noextract=()

pkgver() {
  cd "$srcdir/$pkgname"

  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
