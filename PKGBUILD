# Maintainer: Moksh Malde maldemoksh437@gmail.com

pkgname=reconsage-git
pkgver=1.9.0
pkgrel=1
pkgdesc="Advanced passive reconnaissance framework with WAF, rate-limit and fingerprint detection"
arch=('any')
url="https://github.com/glitchxmalde/ReconSage"
license=('MIT')

depends=(
  'python'
  'python-fastapi'
  'python-httpx'
  'python-uvicorn'
  'python-pydantic'
  'python-rich'
  'python-requests'
  'python-dnspython'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "ReconSage-$pkgver"
}

package() {
  cd "ReconSage-$pkgver"

  install -d "$pkgdir/usr/lib/reconsage"
  cp -r . "$pkgdir/usr/lib/reconsage"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/reconsage/main.py "$pkgdir/usr/bin/reconsage"
}
