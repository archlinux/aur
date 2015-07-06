# Contributor: wenLiangcan <boxeed@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=codesearch
pkgver=0.01
pkgrel=3
pkgdesc="A tool for indexing and then performing regular expression searches over large bodies of source code."
arch=('x86_64' 'i686')
url="https://code.google.com/p/codesearch/"
license=('BSD 3-Clause')
install=${pkgname}.install

if [[ ${CARCH} == "x86_64" ]]; then
  source=("$pkgname-$pkgver::https://codesearch.googlecode.com/files/$pkgname-$pkgver-linux-amd64.zip")
  md5sums=('cea96b90bbe51d13a9591f2ef1650502')
  sha1sums=('976e9ce3a9a765539b0ea2333fe2c1d0f8c42f20')
  sha256sums=('5bee62e322ad975072a32aff453d50f6e894ad529b4180baef1115c8c0af010e')
elif [[ ${CARCH} == "i686" ]]; then
  source=("$pkgname-$pkgver::https://codesearch.googlecode.com/files/$pkgname-$pkgver-linux-386.zip")
  md5sums=('5abee89270270b8bee447e4770a30ade')
  sha1sums=('385c6662b7d055f2585052901d04e2b4cc100b1f')
  sha256sums=('38e813c9dc6ab453920a55f8647c5767219df12dddb3c0cc111980af221f90e9')
fi

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 cgrep "$pkgdir/usr/bin/cgrep"
  install -Dm755 cindex "$pkgdir/usr/bin/cindex"
  install -Dm755 csearch "$pkgdir/usr/bin/csearch"
}

