# Maintainer: Vic RH <blitzkriegfc@gmail.com>

pkgname=perimeter81-rpm
pkgver=8.0.4.735
pkgrel=1
_folder='Perimeter81'
_name='Perimeter81'
pkgdesc='Perimeter81 agent application'
arch=('x86_64')
url='https://support.perimeter81.com/docs/downloading-the-agent'
license=('custom:LICENSE')
depends=('systemd' 'netcat')
options=(!strip)
source=(
  "https://static.perimeter81.com/agents/linux/Perimeter81_${pkgver}.rpm"
  'perimeter81helper.service'
  'LICENSE'
)
md5sums=(
  '027ce23779e2a9cda085d5392ca2b079'
  '089b611fb1ecbd3e39e2d2d391743205'
  '64c25ccc5446c93c6073a418f664d3d5'
)

package() {
  cp -r opt usr $pkgdir/
  install -Dm644 $srcdir/perimeter81helper.service $pkgdir/usr/lib/systemd/system/perimeter81helper.service
  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
