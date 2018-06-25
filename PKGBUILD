# Maintainer: Tablet Mode <tablet-mode@monochromatic.cc>
pkgname=py3status-modules
pkgver=0.5.0
pkgrel=1
pkgdesc="Collection of modules for py3status"
arch=('i686' 'x86_64')
url="https://github.com/tablet-mode/py3status-modules"
license=('GPL3')
depends=('python>=3.2' 'py3status>=2.0')
optdepends=(
    'task: taskstatus module'
    'python-mpd2: mpdstatus module'
    'upower: batterystatus module'
    'python-dbus: batterystatus module'
    'alsa-utils: alsastatus module'
)
conflicts=("$pkgname")
source=(https://github.com/tablet-mode/$pkgname/archive/$pkgver.tar.gz)
md5sums=('1379189f3688dab41802fde6a7d1fed1')
sha256sums=('2cb34d4483fdd915d25dbbc286b95bd732c83f86ab2bb8b57caa3c43cc0d569e')
sha512sums=('48a651bee8be41c85d1407dc3b327867d4d7ff2acb405b27ddda2c101fa54ab42e58a54ca9690ebefd4684c428ee539832017d74e113ed1922c916ca9aeba714')

package() {
  cd py3status-modules-$pkgver

  install -d "$pkgdir"/usr/share/"$pkgname"
  install mailstatus/mailstatus.py "$pkgdir"/usr/share/"$pkgname"
  install batterystatus/batterystatus.py "$pkgdir"/usr/share/"$pkgname"
  install taskstatus/taskstatus.py "$pkgdir"/usr/share/"$pkgname"
  install mpdstatus/mpdstatus.py "$pkgdir"/usr/share/"$pkgname"
  # doc
  install -d "$pkgdir"/usr/share/doc/"$pkgname-$pkgver"
  install -m644 README.rst "$pkgdir"/usr/share/doc/"$pkgname-$pkgver"
  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
