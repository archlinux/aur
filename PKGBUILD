# Maintainer: Nick Cao <nickcao@nichi.co>
pkgname=arch-prime-git
pkgver=0.9.3.r0.gfd14221
pkgver() {
  cd ArchPrime
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc='Provide nvidia-prime like package for Archlinux'
arch=('any')
url='https://gitlab.com/NickCao/ArchPrime'
license=('GPL3')
depends=('bash' 'nvidia')
makedepends=('git')
optdepends=('bbswitch: for powering off the nvidia GPU')
source=('git+https://gitlab.com/NickCao/ArchPrime')
md5sums=('SKIP')

package() {
        install -dm 755 "${pkgdir}"/etc/prime
        cp -r --no-preserve='ownership' "${srcdir}"/ArchPrime/conf/ "${pkgdir}"/etc/prime
	install -Dm755 "${srcdir}"/ArchPrime/prime-select.sh "${pkgdir}"/usr/bin/prime-select
}
