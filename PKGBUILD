# Maintainer: William Di Luigi <williamdiluigi@gmail.com>

pkgname=testlib
pkgver=0.9.41
pkgrel=1
pkgdesc="A library used to write the auxiliary programs (validators, generators, and so on) for programming contest problems."
arch=('any')
url="http://codeforces.com/testlib"
license=('MIT')
makedepends=(
  'git'
  'unzip'
)

source=(
  "https://github.com/MikeMirzayanov/testlib/archive/refs/tags/${pkgver}.zip"
)
sha256sums=(
  'SKIP'
)


package() {
  unzip -o ${pkgver}.zip
  cd testlib-${pkgver}

  # Copy testlib.h
  install -D -m644 testlib.h $pkgdir/usr/include/testlib.h

  # Copy auxiliary files
  install -d -m644 $pkgdir/usr/share/testlib/checkers
  install -D -m644 checkers/*.cpp $pkgdir/usr/share/testlib/checkers
  install -d -m644 $pkgdir/usr/share/testlib/generators
  install -D -m644 generators/*.cpp $pkgdir/usr/share/testlib/generators
  install -d -m644 $pkgdir/usr/share/testlib/interactors
  install -D -m644 interactors/*.cpp $pkgdir/usr/share/testlib/interactors
  install -d -m644 $pkgdir/usr/share/testlib/validators
  install -D -m644 validators/*.cpp $pkgdir/usr/share/testlib/validators
}
