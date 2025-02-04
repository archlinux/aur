_pyname=panoramax_cli
pkgname=${_pyname}
pkgver=1.1.4
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
b2sums=('d326dab7d00aa1d5c7f77fde0359499aa31005c455896a25cfd36fc77ea3e0782650bed1f37357f397c0c2afe8e0814acf8436123b0f1cc40f2f9a56b7d81493')

build() {
  cd "cli-${pkgver}"
  python -m build -wn
}

package() {
  cd "cli-${pkgver}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
