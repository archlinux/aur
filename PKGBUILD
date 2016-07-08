# Maintainer: Streetwalrus <streetwalrus@codewalr.us>
pkgname=kati-git
pkgver=20160630.d26caad
pkgrel=1
pkgdesc="An experimental GNU make clone"
arch=('i686' 'x86_64')
url="https://github.com/google/kati"
license=('Apache')
depends=('ninja' 'bash')
makedepends=('git')
source=('git+https://github.com/google/kati.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/kati"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}/kati"
  make
}

package() {
  cd "${srcdir}/kati"

  for file in m2n ckati
  do
    install -Dm755 ${file} ${pkgdir}/usr/bin/${file}
  done
}

# vim:set ts=2 sw=2 et ft=sh:
