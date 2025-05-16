# Maintainer: Chris Werner Rau <aur@cwrau.io>
# Submitter: Chris Werner Rau <aur@cwrau.io>

pkgname=python-dynmen
_name=${pkgname#python-}
pkgver=0.1.5 # renovate: datasource=pypi depName=dynmen
pkgrel=2
pkgdesc="Python wrappers for dynamic menus (dmenu, rofi, fzf, ...)"
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}"
license=('MIT')
depends=('python' 'python-traitlets>=4.3.2')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('42d3bd58e94435a528d7cb0d57b04fce')

build() {
  cd "$srcdir"/${_name}-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
