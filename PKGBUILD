# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: rich_o <rich_o@lavabit.com>

pkgname=subdl
pkgver=1.0.2
pkgrel=2
pkgdesc="A command-line tool for downloading subtitles from opensubtitles.org"
arch=('any')
url="http://www.cubewano.org/subdl"
license=('GPL3')
depends=('python')
makedepends=('patch')
source=(http://www.cubewano.org/$pkgname/downloads/$pkgver/$pkgname-$pkgver.tar.gz
        $pkgname-$pkgver-api.patch)
md5sums=('9932f84855533aeb413e8c719bf9c500'
         '013fbb829fee96fdd7a8c6befcb4e3fc')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  patch -Np0 -i ${srcdir}/$pkgname-$pkgver-api.patch || return 1

  install -Dm755 $pkgname ${pkgdir}/usr/bin/$pkgname || return 1
}
