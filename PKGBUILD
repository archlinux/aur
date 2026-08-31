pkgname=streamdock-n4e
pkgver=0.1.0
pkgrel=1
pkgdesc='Native Linux controller for the VSDinside Stream Dock N4E'
arch=('any')
url='https://github.com/MiraboxSpace/StreamDock-Device-SDK'
license=('MIT')
depends=('python' 'pyside6' 'python-flask' 'python-pillow' 'python-pyudev')
makedepends=('git')
source=('streamdock::git+https://github.com/MiraboxSpace/StreamDock-Device-SDK.git'
        'streamdock_native.py'
        'streamdock_wrapper.py'
        'streamdock-n4e.desktop')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  install -Dm755 streamdock_native.py "$pkgdir/usr/bin/streamdock-n4e"
  install -Dm644 streamdock_wrapper.py "$pkgdir/usr/share/streamdock/streamdock_wrapper.py"
  install -Dm644 streamdock-n4e.desktop "$pkgdir/usr/share/applications/streamdock-n4e.desktop"
  mkdir -p "$pkgdir/usr/share/streamdock/sdk"
  cp -a streamdock/Python-SDK/src "$pkgdir/usr/share/streamdock/sdk/Python-SDK"
}
