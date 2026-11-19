# Maintainer: Tea <icepie.dev@gmail.com>

pkgname=godwit-bin
pkgver=1.39.3
pkgrel=1
pkgdesc='AI-native desktop email client with local privacy masking (prebuilt binary)'
arch=('x86_64')
url='https://github.com/godwit-email/godwit'
license=('Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1')
provides=("godwit=${pkgver}")
conflicts=('godwit')
options=('!strip' '!debug')
source_x86_64=("godwit-${pkgver}-x86_64.deb::https://dl.godwit.email/godwit_${pkgver}_amd64.deb")
sha256sums_x86_64=('59c64edadc8c57bf41af3d07eda8fb5c237d420ea0937e3a0bbdd9a845179abc')
noextract=("godwit-${pkgver}-x86_64.deb")

package() {
  bsdtar -xOf "$srcdir/godwit-${pkgver}-x86_64.deb" data.tar.gz |
    bsdtar -xf - -C "$pkgdir"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/godwit/godwit "$pkgdir/usr/bin/godwit"
}
