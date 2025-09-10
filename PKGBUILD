_pyname=panoramax_cli
pkgname=${_pyname}
pkgver=1.2.0
pkgrel=1
pkgdesc="CLI tool for uploading your pictures to Panoramax"
arch=(any)
url="https://gitlab.com/panoramax/clients/cli"
license=('MIT')
depends=('python>=3.9' 'python-geo-picture-tag-reader' 'python-httpx' 'python-packaging' 'python-qrcode' 'python-rich' 'python-tenacity' 'python-tomli' 'python-tomli-w' 'python-typer')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'python-flit-core')
optdepends=()
conflicts=()
source=("https://gitlab.com/panoramax/clients/cli/-/archive/${pkgver}/cli-${pkgver}.tar.gz")
b2sums=('3035167e93af40d8b2bd86478f8bf0953d6774daa49430d1ad6e3512dff444749cc745a63f3be9d808e129b62110481b66bc291700a32f9bd7551456d6623bab')

build() {
  cd "cli-${pkgver}"
  python -m build -wn
}

package() {
  cd "cli-${pkgver}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
