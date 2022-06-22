# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=meshtastic-python
_name=Meshtastic-python
pkgver=1.2.95
pkgrel=1
pkgdesc="Python CLI and API for talking to Meshtastic devices"
arch=('any')
url="https://github.com/meshtastic/Meshtastic-python"
license=('Apache')
depends=('python-pyserial' 'python-protobuf' 'python-pypubsub' 'python-dotmap' 'python-pexpect' 'python-pyqrcode' 'python-tabulate' 'python-timeago' 'python-pyyaml' 'python-pygatt')
makedepends=('python-setuptools')
source=("https://github.com/meshtastic/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('33f9db851b18ced44244393e2eca98f877edc351bdc80db198de0c5caf1ffe85')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
