_pyname=panoramax_cli
pkgname=${_pyname}
pkgver=1.2.3
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
b2sums=('e9543f325d5df6ed7f25148253d5538fbec49440bf132c2c0209cb3fff2bc560f88e853cc4e7fdfac53bae663b00fdc9e1f0b93ee24fcb0115bada0f1306b8f6')

build() {
  cd "cli-${pkgver}"
  python -m build -wn
}

package() {
  cd "cli-${pkgver}"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
