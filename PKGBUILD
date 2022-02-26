# Maintainer: Nobbele <realnobbele@gmail.com>
pkgname=unityhub-beta
pkgver=3.1.0beta.1
pkgrel=1
pkgdesc="Unity Hub beta"
arch=('x86_64')
url="https://unity.com/"
license=('custom')
depends=('nss' 'gtk3' 'cpio' 'gzip')
optdepends=('libappindicator-gtk3: The DEB says this an optional dependency')
provides=('unityhub')
install='unityhub.install'
source=(
  "$pkgname-$pkgver.deb::https://hub.unity3d.com/linux/repos/deb/pool/main/u/unity/unityhub-amd64-3Beta.1.0-beta.1.deb"
  'license.txt'
)
sha256sums=(
  '98fe432876aec70fc010a643ff9ae1c25b7dc5d0e7ca03e055df92eac47e0b99'
  'f0eb3a4bb148bb7f426e4f5b97e891265ac487710cbcba9282518537c7b5d833'
)
OPTIONS=(!strip)

package() {
  tar -xf 'data.tar.bz2' -C "$pkgdir/"
  mkdir -p "$pkgdir/usr/bin"
  ln -sf '/opt/unityhub/unityhub' "$pkgdir/usr/bin/unityhub"

  install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
