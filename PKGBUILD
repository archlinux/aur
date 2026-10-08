# Maintainer: Amolith <amolith@secluded.site>
# Maintainer: Viktoras Agejevas <v.agejevas@gmail.com>
pkgname=goradion-bin
_pkgname=${pkgname%-bin}
pkgver=0.13.0
pkgrel=1
pkgdesc='Terminal based online radio player (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/agejevasv/goradion'
license=('Unlicense')
depends=('glibc' 'libgcc' 'alsa-lib')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source_x86_64=("$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$_pkgname-linux-amd64")
source_aarch64=("$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/$_pkgname-linux-arm64")
b2sums_x86_64=('7f31519f82e4ccc726f41142925f680a656ea4ddcedd316ece2ada5d464491fcadeadba0b4e07ad7d695fcc915bfb35f8d51c9e4eb6306edbf3a25ec9379d752')
b2sums_aarch64=('9b893329d074843462e8db22bdabf0f04fea4c239b556c62b4f1ba5ac7a40785c0c1f1fd598b1d77ba7f10e871e76d3b2b11d40208e08a3caf3d6a9fffa9ae91')

package() {
  install -Dm0755 "$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
}
