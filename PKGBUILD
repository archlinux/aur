# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=httptap-py
pkgver=0.8.2
pkgrel=1
pkgdesc="Break HTTP requests into DNS, connect, TLS, wait and transfer phases with waterfall timelines"
arch=('any')
url="https://github.com/ozeranskii/httptap"
license=('Apache-2.0')
depends=('python' 'python-argcomplete' 'python-cryptography' 'python-httpcore' 'python-httpx' 'python-rich')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-uv-build')
conflicts=('httptap-bin')
source=("https://files.pythonhosted.org/packages/source/h/httptap/httptap-${pkgver}.tar.gz")
sha256sums=('d28d5333c1f65b985895ce88b87ef9a90cfbdf73ab36b9c50e55fa161e5aeec3')

build() {
  cd "httptap-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "httptap-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
