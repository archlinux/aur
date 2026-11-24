# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gibr
pkgver=0.10.2
pkgrel=1
pkgdesc="Create Git branches from issue trackers"
arch=('any')
url="https://github.com/ytreister/gibr"
license=('MIT')
depends=('python' 'python-click' 'python-dotenv' 'python-gitpython' 'python-requests' 'python-slugify' 'python-tabulate')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/source/g/gibr/gibr-${pkgver}.tar.gz")
sha256sums=('2f278040f5fc8c3e48ea78bb8f9ddb3c6ab86106864afc82bb8b9f12849bbb7f')

build() {
  cd "gibr-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "gibr-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
