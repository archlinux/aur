# Maintainer: milk on freenode
_pkgname=we-get
pkgname=${_pkgname}-git
pkgver=1.1.0.r13.gaeec72f
pkgrel=1
pkgdesc="Command-line tool for searching torrents."
#epoch=0
arch=('i686' 'x86_64')
url="https://github.com/rachmadaniHaryono/we-get"
license=('MIT')
groups=()
depends=('python-prompt_toolkit' 'python-docopt' 'python-colorama')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(git+https://github.com/rachmadaniHaryono/we-get)
noextract=()
md5sums=('SKIP')

pkgver()
{
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

# check()
# {
  # cd "$_pkgname"
# }

prepare()
{
  cd "$_pkgname"
}

package() {
  cd ${_pkgname}
  python setup.py install --root="${pkgdir}"
}
