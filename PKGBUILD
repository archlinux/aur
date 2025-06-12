# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

pkgname="mkdocs-exclude"
pkgver=1.0.2
pkgrel=1
pkgdesc="A mkdocs plugin that lets you exclude files or trees."
url="https://github.com/apenwarr/mkdocs-exclude"
license=('Apache-2.0')
arch=("any")
depends=("mkdocs")
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/54/b5/3a8e289282c9e8d7003f8a2f53d673d4fdaa81d493dc6966092d9985b6fc/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ba6fab3c80ddbe3fd31d3e579861fd3124513708271180a5f81846da8c7e2a51')

build(){
    cd ${srcdir}/${pkgname}-${pkgver}

    python -m build --wheel --no-isolation
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}

    install -D -m 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m 644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

