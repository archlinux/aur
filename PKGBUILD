# Maintainer: Ryan Putrama Yahya <punkofthedeath at gmail.com>
pkgname=ngit
pkgver=3.1.0
pkgrel=1
pkgdesc='cli and git plugin for code collaboration over nostr'
arch=('any')
url='https://ngit.dev/'
license=('MIT')
depends=('git' 'libsecp256k1')
source=("git+https://ngit.danconwaydev.com/npub15qydau2hjma6ngxkl2cyar74wzyjshvl65za5k5rl69264ar2exs5cyejr/ngit.git#tag=v${pkgver}")
sha256sums=('b4616b28e783885912092060dc8543d0c68d61c0e44a323214e5d770731958a0')

build() {
  cd "${pkgname}"
  cargo build --release
}

package() {
  cd "${pkgname}"
  install -Dm 0755 "target/release/ngit" "${pkgdir}/usr/bin/ngit"
  install -Dm 0755 "target/release/git-remote-nostr" "${pkgdir}/usr/bin/git-remote-nostr"
}
