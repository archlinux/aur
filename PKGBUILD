# Maintainer: Sreejith <vector@vectorspace.xyz>
pkgname=mkdocs-awesome-nav
pkgver=0.1
pkgrel=1
pkgdesc='An MkDocs plugin that simplifies configuring page titles and their order'
arch=('any')
url='https://github.com/lukasgeiter/mkdocs-awesome-nav'
license=('MIT')
depends=('python' 'mkdocs' 'python-wcmatch' 'python-natsort' 'python-pydantic')
makedepends=('python-flit-core' 'python-build')
source=("${pkgname}.zip"::"https://github.com/lukasgeiter/mkdocs-awesome-nav/archive/refs/heads/main.zip")
sha256sums=('SKIP')

build() {
  cd "mkdocs-awesome-nav-main"
  python -m build --wheel --no-isolation
}

package() {
  cd "mkdocs-awesome-nav-main"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE.md' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
