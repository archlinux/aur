# Maintainer: pumpkincheshire <sollyonzou@gmail.com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=github-release-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Command-line app to create and edit releases on GitHub (and upload artifacts) — built from pre-compiled binary."
arch=('x86_64')
url="https://github.com/github-release/github-release"
license=('MIT')
conflicts=('github-release')
depends=('glibc')
source=("${url}/releases/download/v${pkgver}/linux-amd64-github-release.bz2"
  "LICENSE::https://raw.githubusercontent.com/github-release/github-release/master/LICENSE")
sha512sums=('9dbdd361117caedb201a1644ad2d23c53c1b647531e40c89db5a8ede9f647e1089447f282fb8945c181b520b8d58a9a681749d3fffd2522b2ac43d5a76ed5871'
  '9d19258b39b9d1c30e7cce85c4ea38c4b818f7b0189c90f938d25134b65e22ae1cc204fb02324d1df1221b35aae3c687919c1f3d1ebd7cea91533255cb7c6da0')

package() {
  install -Dm755 $srcdir/linux-amd64-github-release "${pkgdir}/usr/bin/github-release"

  install -Dm755 $srcdir/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
