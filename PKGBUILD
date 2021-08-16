# Maintainer: https://github.com/TechLearnersInc
# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=free-hash-checker
pkgver=3.0
pkgrel=3
pkgdesc="A simple and elegant open-source hash checker software."
arch=('x86_64')
url="https://github.com/TechLearnersInc/Free-Hash-Checker"
license=('MIT')
depends=('python>=3.7.0' 'pyside2>=5.15.2' 'python-requests>=2.24.0')
source=(Free-Hash-Checker.tar.gz::"https://github.com/TechLearnersInc/Free-Hash-Checker/archive/v${pkgver}.tar.gz"
                             	  "Free-Hash-Checker.desktop.in")
md5sums=('584c25bdbb413dc8996533db17d7fca7' 
		 'bcb0403f221a9d4908e330901c9ae541')

package() {
  cd ${srcdir}/Free-Hash-Checker-*
  
  install -dm755 ${pkgdir}/usr/lib/Free-Hash-Checker
  install -dm755 ${pkgdir}/usr/lib/Free-Hash-Checker/ui
  install -dm755 ${pkgdir}/usr/share/pixmaps
  install -dm755 ${pkgdir}/usr/share/applications
  install -dm755 ${pkgdir}/usr/bin/
  
  cp -avr *.py ${pkgdir}/usr/lib/Free-Hash-Checker
  cp -avr ui/*.py ${pkgdir}/usr/lib/Free-Hash-Checker/ui
  cp -v ${srcdir}/Free-Hash-Checker-*/logo/hash_checker_icon.png ${pkgdir}/usr/share/pixmaps/free-hash-checker.png
  cp -v "../Free-Hash-Checker.desktop.in" ${pkgdir}/usr/share/applications/Free-Hash-Checker.desktop
  cp -v ${srcdir}/Free-Hash-Checker-*/LICENSE ${pkgdir}/usr/lib/Free-Hash-Checker/LICENSE.txt
}
