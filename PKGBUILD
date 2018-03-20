# Maintainer: Pablo <pablo1@mailbox.org>
pkgname=zenbu-git
_pkgname=zenbu
pkgver=1.0.5.141
pkgrel=1
pkgdesc="A Jinja2 + YAML based config templater written in python"
arch=(any)
url="https://github.com/metakirby5/zenbu"
license=('MIT')
groups=()
depends=('python' 'python-argcomplete' 'python-colorlog' 'python-jinja' 'python-pyaml' 'python-termcolor' 'python-watchdog')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('git://github.com/metakirby5/zenbu.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  echo "$(python setup.py --version).$(git rev-list --count HEAD)"
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --prefix="/usr" --root="$pkgdir"
}
# vim:set ts=2 sw=2 et:
