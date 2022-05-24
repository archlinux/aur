# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Contributor: Jeff Mickey <j@codemac.net>

pkgname=speedometer
#_debianver=2.8-3    # Debian fork
pkgver=2.9
pkgrel=1
pkgdesc="Measure and display the rate of data across a network connection or data being stored in a file"
arch=('any')
url="http://excess.org/speedometer/"
license=('GPL')
#depends=('python-psutil' 'python-six' 'python-urwid')    # Debian fork
depends=('python-psutil' 'python-setuptools' 'python-urwid')
#source=(http://ftp.us.debian.org/debian/pool/main/s/speedometer/speedometer_${_debianver}_all.deb)    # Debian fork
source=($pkgname-$pkgver::https://github.com/wardi/speedometer/archive/refs/tags/release-$pkgver.tar.gz)
sha1sums=('7c113356a31d2bc7bb53255661c6f3757025d76e')

#package() {
#  # Debian fork
#  bsdtar xf data.tar.xz --directory="$pkgdir/" usr/bin/speedometer usr/share/doc/speedometer/ usr/share/man/
#}

package() {
  cd $pkgname-release-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1

  mv "$pkgdir/usr/bin/speedometer"{.py,}
  rm -r "$pkgdir/usr/lib/"
}

