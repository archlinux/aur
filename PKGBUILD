# Maintainer: Nick Cao <nickcao@nichi.co>
pkgname=arch-prime-git
pkgver=0.9.4.r2.ge754390
pkgver() {
  cd ArchPrime
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc='Provide nvidia-prime like package for Archlinux'
arch=('any')
url='https://gitlab.com/NickCao/ArchPrime'
license=('GPL3')
makedepends=('git')
optdepends=('bbswitch: for powering off the nvidia GPU')
source=('git+https://gitlab.com/NickCao/ArchPrime')
md5sums=('SKIP')

package() {
        install -dm 755 "${pkgdir}"/etc/prime/conf/
        cp -r --no-preserve='ownership,mode' "${srcdir}"/ArchPrime/conf/* "${pkgdir}"/etc/prime/conf/
	install -Dm755 "${srcdir}"/ArchPrime/prime-select "${pkgdir}"/usr/bin/prime-select
	install -Dm755 "${srcdir}"/ArchPrime/prime-run "${pkgdir}"/usr/bin/prime-run
}
