# Maintainer: Nobbele <realnobbele@gmail.com>
pkgname=unityhub-beta
pkgver=3.3.0beta.2
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
  "$pkgname-$pkgver.deb::https://hub-dist.unity3d.com/artifactory/hub-debian-prod-local/pool/main/u/unity/unityhub_amd64/unityhub-amd64-3Beta.3.0-beta.2.deb"
  'license.txt'
)
sha256sums=('1f4a132241ed4fd0da029c816321710beb1689e9a980b9169239e8d6da4caf8e'
            'f0eb3a4bb148bb7f426e4f5b97e891265ac487710cbcba9282518537c7b5d833')
OPTIONS=(!strip)

package() {
  tar -xf 'data.tar.bz2' -C "$pkgdir/"
  mkdir -p "$pkgdir/usr/bin"
  ln -sf '/opt/unityhub/unityhub' "$pkgdir/usr/bin/unityhub"

  install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
