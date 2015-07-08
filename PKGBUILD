# Maintainer: OS Hazard <oshazard+aur@gmail.com>
pkgname=aurlist
pkgver=0.6
pkgrel=2
pkgdesc="Download list of all AUR packages and search colorized list"
url="http://github.com/oshazard/aurlist"
license="GPL"
arch=('any')
depends=('grep' 'sed' 'bash' 'curl' 'coreutils' 'ca-certificates')
provides=('aurlist')
backup=('usr/share/aurlist/aurlist.txt' 'usr/share/aurlist/aurlist.lst')
source=("https://github.com/oshazard/aurlist/archive/master.tar.gz")
md5sums=('f13c1d11bfd03a311770071b57e6307b')

package() {
  cd "${srcdir}/aurlist-master"

  # Install script
  mkdir -p "$pkgdir/usr/bin"
  install -m755 aurlist "$pkgdir/usr/bin/aurlist"

  # Create list directory
  mkdir -p "$pkgdir/usr/share/aurlist"
  chmod 777 "$pkgdir/usr/share/aurlist"
  install -m777 usr/share/aurlist/aurlist.txt "$pkgdir/usr/share/aurlist/aurlist.txt"
  install -m777 usr/share/aurlist/aurlist.lst "$pkgdir/usr/share/aurlist/aurlist.lst"

  # Install GPLv3
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

