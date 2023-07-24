# Maintainer: phanium <$(echo bnhoc2R1QHFxLmNvbQo= | base64 -d)>

_pkgname=qrcode_terminal
pkgname=python-$_pkgname
pkgver=0.8
pkgrel=1
pkgdesc="draw qrcodes in your terminal by python"
arch=('any')
url="https://github.com/alishtory/qrcode-terminal"
license=('MIT')
depends=('python'
         'python-qrcode'
         'python-pillow'
)
makedepends=('python-setuptools' 'python-pip')
source=(
  "https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/qrcode-terminal-$pkgver.tar.gz"
)
sha256sums=('1e2b69e662b9346e98dd95983033e9d43cff0643d8afda12605f515428e666c0')

build() {
  cd qrcode-terminal-$pkgver
  python setup.py build
}

package() {
  cd qrcode-terminal-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
