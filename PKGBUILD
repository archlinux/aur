# Maintainer: Tablet Mode <tablet-mode@monochromatic.cc>
pkgname=py3status-modules
pkgver=0.3.0
pkgrel=1
pkgdesc="Collection of modules for py3status"
arch=('i686' 'x86_64')
url="https://github.com/tablet-mode/py3status-modules"
license=('GPL3')
depends=('python>=3.2' 'py3status>=2.0')
optdepends=(
    'task>=2.4.4: taskstatus module'
    'python-mpd2>=0.4.6: mpdstatus module'
    'upower>=0.99.0: batterystatus module'
    'python-dbus>=1.2.0: batterystatus module'
    'alsa-utils>=1.0.29: alsastatus module'
)
conflicts=("$pkgname")
source=(https://github.com/tablet-mode/$pkgname/archive/$pkgver.tar.gz)
sha512sums=('54847cb944ae0dc8e24e1c5f8844a775fddd524c68c40064c508f6a1ff91733fdf5cb7969bf496f88d2a9a1c0b671f7b3bc3079746202b43ff4fbead8f9e4127')
sha256sums=('677824f39384204436af45dfa294d9f23b5f83ecc956dff3f335e5fd9321b76b')
md5sums=('ffc9dcc24578372fd593eaf6507c334f')

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
