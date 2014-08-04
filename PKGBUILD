# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=iyfct
pkgver=1.02
pkgrel=1
pkgdesc="In Your Face City Trains - survive as long as you can"
arch=('any')
url="http://simonlarsen.github.io/2011/05/29/in-your-face-city-trains.html"
license=('CCPL:by' 'GPL3')
depends=('love')
source=("https://github.com/SimonLarsen/iyfct/releases/download/v$pkgver/iyfct-$pkgver.love"
        "iyfct.sh")
sha256sums=('37c6288ad8e7c5a7974bd481c61a14a87d6cf8399a93bc4f9a352d89292961a4'
            '89a21553f5a47f1a5d43a32eafb4261e5fc169292319214d68d9748f25f08e28')

prepare() {
  # extract license + readme
  bsdtar xf iyfct-$pkgver.love README.textile LICENCE
}

package() {
  # copy love package
  install -Dm644 iyfct-$pkgver.love "$pkgdir"/usr/share/iyfct/iyfct.love
  # launcher
  install -Dm755 iyfct.sh "$pkgdir"/usr/bin/iyfct
  # readme + license
  install -Dm644 README.textile "$pkgdir"/usr/share/doc/iyfct/README.textile
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}
