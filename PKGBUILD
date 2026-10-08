# Maintainer: ParticleG <particle_g@outlook.com>

pkgname=akagims-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='Mahjong Soul AI assistant with an integrated game window (binary release)'
arch=('x86_64')
url='https://github.com/shinkuan/AkagiMS'
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'gtk3' 'hicolor-icon-theme' 'webkit2gtk-4.1')
provides=('akagims')
conflicts=('akagims')
options=('!strip' '!debug')

_tag="ms-$pkgver"
_archive="akagims-$pkgver-linux-x64"
source=(
  "$pkgname-$pkgver.zip::$url/releases/download/$_tag/$_archive.zip"
  "$pkgname-$pkgver.svg::https://raw.githubusercontent.com/shinkuan/AkagiMS/$_tag/assets/logo/akagi-icon-light.svg"
  'akagims'
  'akagims.desktop'
)
sha256sums=(
  'a7ae109a94d939743f870465ce19b01085b61c0eb8d421b9a1b521daf6856908'
  '0c183b906f86fec4aec3b9c48ca2455455678e42cd9dd9f15101f770f3154ea6'
  'b12cf0b0bdebecb6d3df948b4f44348a0c42467868dd262a8ad78102c60ee8f8'
  '07defc1c36025ff197a16725a7cf0e9b0edfdce206d24adbaae7e29210db8a0b'
)

package() {
  install -d "$pkgdir/opt"
  cp -a "$srcdir/$_archive" "$pkgdir/opt/akagims"

  install -Dm755 "$srcdir/akagims" "$pkgdir/usr/bin/akagims"
  install -Dm644 "$srcdir/akagims.desktop"     "$pkgdir/usr/share/applications/akagims.desktop"
  install -Dm644 "$srcdir/$pkgname-$pkgver.svg"     "$pkgdir/usr/share/icons/hicolor/scalable/apps/akagims.svg"
  install -Dm644 "$srcdir/$_archive/LICENSE.txt"     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_archive/NOTICE"     "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
