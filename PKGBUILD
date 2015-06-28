# Maintainer: Tablet Mode <tablet-mode@monochromatic.cc>
pkgname=py3status-modules
pkgver=0.2.0
pkgrel=1
pkgdesc="Collection of modules for py3status"
arch=('i686' 'x86_64')
url="https://github.com/tablet-mode/py3status-modules"
license=('GPL3')
depends=('python>=3.2' 'py3status>=1.1')
optdepends=(
    'python-mpd2>=0.4.6: MPD status module'
    'upower>=0.99.0: battery status module'
    'python-dbus>=1.2.0: battery status module'
)
conflicts=("$pkgname")
source=(https://github.com/tablet-mode/$pkgname/archive/$pkgver.tar.gz)
sha512sums=('4c3fe5416e9654b49064090564e7ee0dcce06d4fd69d644fd35bb945c5dea1d92bc3860096fa05836e5010d9ceeba41cbe1f17b2d75797dceee09aace8f5c7e3')
sha256sums=('a4058f805d96898a947b8e470480e12586c09d83c61ed6f11f4adbceb76fae37')
md5sums=('cd2355ef8627b567104dba739040b448')

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
