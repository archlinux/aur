# Maintainer: Max Zhao <alcasa.mz@gmail.com>
# Contributor: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

pkgname=instant-rst
_commit=48ebd40  # 7 digits
pkgver=20180612
pkgrel=1
pkgdesc="A local server for preview rst document instantly"
arch=('any')
url="https://github.com/Rykka/instant-rst.py"
license=('CPL')
depends=('python-flask' 'python-docutils' 'python-pygments' 'python-flask-socketio' 'python-socketio' 'python-future')
makedepends=('python-setuptools')
optdepends=('vim' 'neovim')
source=("${pkgname}::git+https://github.com/tlinhart/${pkgname}.py.git#commit=${_commit}")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd "${pkgname}"

  python setup.py build
}

package() {
  cd "${pkgname}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 cc=80 et:
