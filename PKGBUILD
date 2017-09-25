# Maintainer: Maikel Wever <maikelwever@gmail.com>
# Contributor: Morten Linderud <morten@linderud.pw>

pkgname=pipenv
pkgver=7.9.2
pkgrel=1
pkgdesc="Sacred Marriage of Pipfile, Pip, & Virtualenv."
url="https://docs.pipenv.org"
arch=('any')
license=('MIT')
conflicts=('python-pipenv')
depends=('python' 'python-pip' 'python-pew' 'pip-tools'
         'python-virtualenv' 'flake8' 'python-requests')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kennethreitz/pipenv/archive/v${pkgver}.tar.gz")
sha256sums=('251d725a19a2911add4b0a508cf723a83aa16b10fd8379b16bee995886d23219')

build(){
  cd "$srcdir/pipenv-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/pipenv-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
