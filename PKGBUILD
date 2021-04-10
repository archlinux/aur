# Maintainer: lmartinez-mirror
pkgname=frangipanni-bin
_pkgname=${pkgname%-bin}
pkgver=0.5.0
pkgrel=1
pkgdesc="Program to convert lines of text into a tree structure"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/birchb1024/frangipanni"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_amd64.tgz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_386.tgz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${_pkgname}_linux_arm64.tgz")
source=("https://raw.githubusercontent.com/birchb1024/frangipanni/v$pkgver/LICENSE"
        "https://raw.githubusercontent.com/birchb1024/frangipanni/v$pkgver/README.md")
sha256sums=('3cef0d7345e2a2f9205ad48191decfb293d2f72fa3fdcd6794f32868f9863bf7'
            'c8f1109b2031b6bfe7fdcb31c3dd642327dc7659703e4be6228fdc38861a1441')
sha256sums_x86_64=('9a77864b3bc793e33e181566cd07dd88940c15a38c26f1f01eebdad39c7d46b8')
sha256sums_i686=('e34afc5ae3cfdfb61c3b35924ec37d3e70b342022f96a4d433ffcef695cc9f1c')
sha256sums_aarch64=('fe77627ab6d3879e234dd986ef217339a86dd1044932fd91381293bbb331cf04')

package() {
  install -Dm 755 frangipanni_linux_* "$pkgdir/usr/bin/frangipanni"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

