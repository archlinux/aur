# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=project-generator
pkgver=0.11.3
pkgrel=1
pkgdesc="Project generators for various embedded tools (IDE)"
url="https://github.com/project-generator/project_generator"
depends=('python'
         'python-setuptools'
         'python-yaml'
         'python-jinja'
         'python-xmltodict'
         'project-generator-definitions'
         )
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/project-generator/${pkgname/-/_}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('9d76f19102083f1dccaa9b42251f5cd85c2735ff8f0b2976b60bd2f2d3ce239c492a651daf094355ca86c44991a7d76ebb4102b6e670e6659f6aac52818f32a7')

prepare() {
    mv "${srcdir}/${pkgname//-/_}-${pkgver}" "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
