# Maintainer: agony <27015 at riseup dot net>
pkgname=ydiskarc
pkgver=1.1.0
pkgrel=1
pkgdesc='Command-line tool to backup public resources from Yandex.Disk'
arch=('any')
url='https://github.com/ruarxive/ydiskarc'
license=('MIT')
depends=('python' 'python-typer' 'python-yaml' 'python-requests' 'python-urllib3' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('204b6ea33dc670ea7088bb9668c8113e43a2bf866ff173c3129fcfd34c9b7ae3')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
