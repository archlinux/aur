# Maintainer: <dns_issue@tutamail.com>
pkgname=python-selenium-driverless
_pypiname=selenium-driverless
pkgver=1.9.4
pkgrel=1
pkgdesc="Undetected Selenium without chromedriver usage (non-commercial license)"
arch=('any')
url="https://github.com/kaliiiiiiiiii/Selenium-Driverless"
license=('custom')  
depends=(
  'python'
  'python-jsondiff'
  'python-aiofiles'
  'python-numpy'
  'python-matplotlib'
  'python-scipy'
  'python-websockets'
  'python-platformdirs'
  'python-orjson'
  'python-selenium'
  'python-aiohttp'
  'python-cdp-socket'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('google-chrome: required at runtime for launching Chrome (Chromium not tested)')
source=("${_pypiname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pypiname:0:1}/${_pypiname}/selenium_driverless-${pkgver}.tar.gz")
sha256sums=('151ccf57d399691ec4e943a941a496dbe575d0154a520cc2eca988ebe5d07a76')

build() {
  cd "selenium_driverless-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "selenium_driverless-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/" 2>/dev/null || true
}
