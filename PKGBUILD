# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Astro Benzene <universebenzene at sina dot com>

pkgname="python-mkdocs-material-pymdownx-extras-git"
pkgver=1.1.3.r1.gbd62bce
pkgrel=1
pkgdesc="MkDocs Material additions used for pymdownx documentation"
url="https://github.com/facelessuser/mkdocs_pymdownx_material_extras"
license=("MIT")
arch=("any")
provides=("mkdocs-pymdownx-material-extras" "python-mkdocs-material-pymdownx-extras")
depends=("mkdocs-material")
makedepends=("python-setuptools" "python-wheel")
source=("git+$url")
sha256sums=("SKIP")

pkgver(){
 cd "mkdocs_pymdownx_material_extras"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build(){
 cd "mkdocs_pymdownx_material_extras"
 python setup.py build
}

package(){
 cd "mkdocs_pymdownx_material_extras"
 python setup.py install --root="$pkgdir" --optimize=1
}
