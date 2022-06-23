# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Lucas Silva <lcdss@live.com>

pkgname=lbry-desktop-bin
pkgver=0.53.4
pkgrel=1
pkgdesc='Desktop app for the lbry-network (Odysee.com) - a decentralized, user-controlled content marketplace and YouTube alternative'
arch=('x86_64')
url='https://lbry.com/'
license=('MIT')
provides=('lbry' 'lbrynet')
depends=('libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libsecret')
source=("https://github.com/lbryio/lbry-desktop/releases/download/v$pkgver/LBRY_$pkgver.deb")
b2sums=('8e512ed7f796fbca95190a11cffd0d9f0a08bb0743e106e612f418782061a2fe3a4fa6bb6e6628d8ed99f3ef897c3bca5cb4b5df2e4445d527c8f4604c6f9061')

package() {
  install -dm 755 "$pkgdir/usr/bin/"
  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
  ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
  ln -s "/opt/LBRY/resources/static/daemon/lbrynet" "$pkgdir/usr/bin/"
}
