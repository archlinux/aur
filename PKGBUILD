# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=bashlint-git
_gitname=bashlint
pkgver=0.1.0.r5.g20877d5
pkgrel=1
pkgdesc="Simple Bash linting tool written in Python"
arch=('any')
url="https://github.com/skudriashev/bashlint"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=('bashlint')
conflicts=('bashlint')
source=('git://github.com/skudriashev/bashlint.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_gitname}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_gitname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
