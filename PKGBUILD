# Maintainer: Maikel Wever <maikelwever@gmail.com>
# Contributor: Morten Linderud <morten@linderud.pw>

pkgname=pipenv
pkgver=8.2.7
pkgrel=1
pkgdesc="Sacred Marriage of Pipfile, Pip, & Virtualenv."
url="https://docs.pipenv.org"
arch=('any')
license=('MIT')
conflicts=('python-pipenv')
depends=('python' 'python-pip' 'python-pew'
         'python-virtualenv' 'flake8' 'python-requests'
         'python-urllib3')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kennethreitz/pipenv/archive/v${pkgver}.tar.gz")
sha256sums=('60e1674f26a5ca8261404f054e46bc5755dc7237300d2b18525eacd1849c704b')

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
