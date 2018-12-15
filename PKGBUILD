pkgname=python-svg2mod-git
_module='svg2mod'
pkgver=r69.a198fa6
pkgrel=1
pkgdesc="Convert Inkscape SVG drawings to KiCad footprint modules"
url="https://github.com/greyltc/svg2mod"
depends=('python')
makedepends=('python-setuptools')
license=('Creative Commons Zero v1.0 Universal')
arch=('any')
source=("git://github.com/greyltc/svg2mod.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_module"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_module}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

