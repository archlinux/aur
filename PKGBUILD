_pyname=panoramax_cli
pkgname=${_pyname}
pkgver=1.1.3
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
b2sums=('e95f83195c38bc8264563e7a7c363449369fde4024a3abe7105cd5e8bb459ef325d010a3447956269e93c1e1f8da3d00e2bc122ed5497f283c89003973215480')

build() {
  cd "cli-${pkgver}"
  python -m build -wn
}

package() {
  cd "cli-${pkgver}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
