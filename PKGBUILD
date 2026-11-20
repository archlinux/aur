# Maintainer: Ryan Putrama Yahya <punkofthedeath at gmail.com>
pkgname=ngit
pkgver=3.2.0
pkgrel=1
pkgdesc='cli and git plugin for code collaboration over nostr'
arch=('any')
url='https://ngit.dev/'
license=('MIT')
depends=('git' 'libsecp256k1')
source=("git+https://ngit.danconwaydev.com/npub15qydau2hjma6ngxkl2cyar74wzyjshvl65za5k5rl69264ar2exs5cyejr/ngit.git#tag=v${pkgver}")
sha256sums=('8115c013c1c25f7eadf3aeb5a533c3a8b5c99c45e9c705dee8f2b84b876692f2')

build() {
  cd "${pkgname}"
  cargo build --release
}

package() {
  cd "${pkgname}"
  install -Dm 0755 "target/release/ngit" "${pkgdir}/usr/bin/ngit"
  install -Dm 0755 "target/release/git-remote-nostr" "${pkgdir}/usr/bin/git-remote-nostr"
}
