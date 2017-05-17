# Maintainer: Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: frownlee <florez.brownlee@gmail.com>

pkgname=android-ndk-beta
_pkgname=${pkgname/-beta*/}
pkgver=r15_beta2
pkgrel=1
pkgdesc='Android C/C++ developer kit (beta)'
arch=('x86_64')
url='https://developer.android.com/ndk/'
license=('GPL' 'LGPL' 'custom')
options=('!strip' 'staticlibs')
backup=('etc/profile.d/android-ndk-beta.sh')
install="$pkgname.install"
depends=('ncurses5-compat-libs')
optdepends=(
  'python: various helper scripts'
)
source=('android-ndk-beta.sh' "https://dl.google.com/android/repository/${_pkgname}-${pkgver/_/-}-linux-x86_64.zip")
sha256sums=('a6b0dae2d8016af6b731bc45a78489cdb3aab5d332c0395188887ee369aea5f5'
            'f986c23b6f102a6e115507e233a2d8b471db4a3e7e5a8b5c9b6d51e7e66109c4')

package() {
  install -d "$pkgdir/opt"
  mv "$_pkgname-${pkgver/_/-}" "$pkgdir/opt/$pkgname"

  install -Dm755 $pkgname.sh "$pkgdir/etc/profile.d/$pkgname.sh"
}

# vim:set ts=2 sw=2 et:
