# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname="mkdocs-material-pymdownx-extras"
pkgver=2.5.5
pkgrel=1
pkgdesc="MkDocs Material additions used for pymdownx documentation"
url="https://github.com/facelessuser/mkdocs_pymdownx_material_extras"
license=("MIT")
arch=("any")
provides=("mkdocs-pymdownx-material-extras")
conflicts=("python-mkdocs-material-pymdownx-extras-git")
replaces=("python-mkdocs-material-pymdownx-extras-git")
depends=("mkdocs-material>=8.3.3")
makedepends=("python-hatchling" 'python-build' 'python-installer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('611019a746d2a0f98f8ff87e1ef679d7ae6b507d59daf47fb4690c3260d7084f')

build(){
    cd "mkdocs_pymdownx_material_extras-${pkgver}"
    python -m build --wheel --no-isolation
}

package(){
    cd "mkdocs_pymdownx_material_extras-${pkgver}"

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
