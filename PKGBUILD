# Maintainer: Agustín DallʼAlba <aur@dallalba.com.ar>
# Contributor: Foxy <foxyblackhat@gmail.com>

pkgname=astreamfs-git
pkgver=1.8.4
pkgrel=1
epoch=1
pkgdesc='Fuse filesystem to read http(s) URL'
arch=('x86_64')
url='https://gitlab.com/BylonAkila/astreamfs'
license=('GPL3')
depends=('fuse')
makedepends=('git')
provides=('astreamfs')
conflicts=('astreamfs')
source=('git+https://gitlab.com/BylonAkila/astreamfs.git')
sha1sums=('SKIP')

pkgver() {
  cd astreamfs
  git describe --long | sed 's/-/.r/;s/-/./'
}

build() {
  cd astreamfs
  make
}

package() {
  cd astreamfs
  install -Dm755 astreamfs "${pkgdir}/usr/bin/astreamfs"
  install -Dm755 1fichier "${pkgdir}/usr/bin/1fichier"
}
