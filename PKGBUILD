_pyname=panoramax_cli
pkgname=${_pyname}
pkgver=1.2.5
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
b2sums=('115986cbf6d2c4a6f9d143b5c903fdeabbb30a56929222fe51ebc1b956e00d0ab56361d7fef7ca5153f31b0409c45b8d17e338defae40a169a85655e056f93bf')

build() {
  cd "cli-${pkgver}"
  python -m build -wn
}

package() {
  cd "cli-${pkgver}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
