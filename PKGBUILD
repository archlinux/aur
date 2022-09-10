# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Lucas Silva <lcdss@live.com>

pkgname=lbry-desktop-bin
pkgver=0.53.5
pkgrel=1
pkgdesc='Desktop app for the lbry-network (Odysee.com) - a decentralized, user-controlled content marketplace and YouTube alternative'
arch=('x86_64')
url="https://github.com/lbryio/lbry-desktop.git"
license=('MIT')
provides=("lbry=$pkgver" "$pkgname=$pkgver" "lbrynet=$pkgver")
depends=('nss' 'alsa-lib' 'gtk3')
replaces=('lbry-app-bin')
conflicts=('lbry' 'lbry-desktop' 'lbry-app-bin' 'lbrynet' 'lbrynet-bin' 'lbry-desktop-git')
depends=('libxtst' 'nss' 'alsa-lib' 'gtk3')
source=("https://github.com/lbryio/lbry-desktop/releases/download/v$pkgver/LBRY_$pkgver.deb"
        'https://raw.githubusercontent.com/lbryio/lbry-desktop/master/LICENSE')
b2sums=('eaefcbb8867195f11a485aadad26dc84772359a3828638cf20e68449948aef6871141815df8757a74cc5a1d86ad7a19eb62bdffbec6b04163249f20017d59e5e'
        'eadd07c9a4210b7d3b2408483433daca30100cdca4590379f376538d2c7cb300d77da3ffcd4950c279c7ecae729fbb2f5f6447c4a4fd8079ef979c54aaa21e42')

package() {
  install -dm 755 "$pkgdir/usr/bin/"
  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
  ln -s "/opt/LBRY/resources/static/daemon/lbrynet" "$pkgdir/usr/bin/"
  cd "${srcdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
