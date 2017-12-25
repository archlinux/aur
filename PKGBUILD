# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=nnn-git
pkgver=1.6.r0.gcd17708
pkgrel=1
pkgdesc='A lightweight terminal file browser'
arch=(x86_64)
url='https://github.com/jarun/nnn'
license=(BSD)
depends=('libncursesw.so' 'libreadline.so')
makedepends=(git)
provides=(nnn)
conflicts=(nnn)
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd nnn
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

package() {
  make -C nnn DESTDIR="${pkgdir}" PREFIX="/usr" install
  install -Dm644 nnn/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
