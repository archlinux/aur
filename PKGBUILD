pkgname=streamdock-n4e
pkgver=0.1.0
pkgrel=1
pkgdesc='Native Linux controller for the VSDinside Stream Dock N4E'
arch=('x86_64')
url='https://github.com/MiraboxSpace/StreamDock-Device-SDK'
license=('MIT')
install=streamdock-n4e.install
depends=('python' 'pyside6' 'python-flask' 'python-pillow' 'python-pyudev')
makedepends=('git')
source=('streamdock::git+https://github.com/MiraboxSpace/StreamDock-Device-SDK.git#commit=df53672a0c484bf6e679728a7a529f80df3cbd0d'
        'streamdock_native.py'
        'streamdock_wrapper.py'
        'streamdock-n4e.desktop'
        '99-streamdock.rules'
        'streamdock-n4e.install')
sha256sums=('SKIP'
           '1673521e882e0a152b25455bfee1359aaf9aec8ece00d95a7fdd0a876eb9e14e'
           'e0e5ee8f7269c81b2962a83c720a0cd839fa832b492d43641af52151564dd2a5'
           '1c11b49de3699f481dc58aaf737dc88f4483477206a9771fc96df0a8409bbb35'
           '03adfdbaf647b70a6a52fb804937a86924bf6194060d15f9aeb518a854f43d9d'
           '9f634c1c1a7fe32929655036212bddfc18f4634e426bf83bcb1143efc02eccc3')

package() {
  install -Dm755 streamdock_native.py "$pkgdir/usr/bin/streamdock-n4e"
  install -Dm644 streamdock_wrapper.py "$pkgdir/usr/share/streamdock/streamdock_wrapper.py"
  install -Dm644 streamdock-n4e.desktop "$pkgdir/usr/share/applications/streamdock-n4e.desktop"
  install -Dm644 99-streamdock.rules "$pkgdir/usr/lib/udev/rules.d/99-streamdock.rules"
  mkdir -p "$pkgdir/usr/share/streamdock/sdk/Python-SDK"
  cp -a streamdock/Python-SDK/src/. "$pkgdir/usr/share/streamdock/sdk/Python-SDK/"
}
