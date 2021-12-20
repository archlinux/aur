# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=project-generator-definitions
pkgver=0.2.43
pkgrel=1
pkgdesc="Definitions for project-generator"
url="https://github.com/project-generator/project_generator_definitions/"
depends=('python'
         'python-setuptools'
         )
makedepends=('python-pip')
license=('Apache')
arch=('any')
source=("https://github.com/project-generator/${pkgname//-/_}/archive/v${pkgver}.tar.gz")
sha512sums=('177bec66404fa0e766bbdbb480577fdcd9d1762be9729ac4cfd92dbca83f3d2581d6a15eb4eacbb6e786cc40c127ca98adf0d0ccb6ad0b62aaf6989b5bb9d312')

prepare() {
    mv "${srcdir}/${pkgname//-/_}-${pkgver}" "${srcdir}/${pkgname}-${pkgver}"
    cp -a "${srcdir}/${pkgname}-${pkgver}"{,-py2}
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python  setup.py install --root="${pkgdir}" --optimize=1
}
