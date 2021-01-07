# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=milksnake
pkgname=python-milksnake
pkgver=0.1.5
pkgrel=2
pkgdesc='Python library that extends setuptools for binary extensions'
arch=('any')
url=https://github.com/getsentry/milksnake
license=('Apache')
depends=('python-cffi' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.zip")
sha512sums=('b8aea094a9c41d837d16e0d0430cf63b26ba890eb542b612e8f3f28ca579fbe42edb14def985a0018d6d3063e935cebe3b286f3adf4978334d824d0ad34ad063')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
