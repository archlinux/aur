# Maintainer: Mikhail f. Shiryaev <mr dot felixoid at gmail dot com>

_pkgbase=pandoc-plantuml-filter
pkgname=${_pkgbase}-py
pkgver=0.1.5
pkgrel=2
pkgdesc='Pandoc filter for PlantUML code blocks, python version'
arch=('any')
url='https://pypi.org/project/pandoc-plantuml-filter'
license=('MIT')
depends=('python' 'python-pandocfilters')
optdepends=('pandoc-cli: using the filter')
conflicts=('pandoc-plantuml-filter')
replaces=('pandoc-plantuml-filter')
source=("https://files.pythonhosted.org/packages/be/e2/e48d2c5053e566f89076a0d650d44ff8a1132701100da054c32fc557ee0d/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=(
  'f6a5de219b82bb8e26f44a0f08f2fb32011ba04c0df753b294b7db9308646584'
  )

build() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
