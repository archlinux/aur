# Maintainer: Filip / hotline1337 <denuvo at tuta dot io>

pkgname=nym-vpn-app-nightly-bin
pkgver=2026.13.0
pkgrel=20260813
_release_tag="nym-vpn-v${pkgver}-nightly.${pkgrel}"
pkgdesc="NymVPN desktop client (Nightly)"
arch=("x86_64")
url="https://github.com/nymtech/nym-vpn-client"
license=("GPL-3.0-only")
depends=(
  "cairo"
  "gcc-libs"
  "gdk-pixbuf2"
  "glib2"
  "gtk3"
  "hicolor-icon-theme"
  "libappindicator-gtk3"
  "libsoup3"
  "nym-vpnd"
  "webkit2gtk-4.1"
)
provides=("nym-vpn-app")
conflicts=("nym-vpn-app")
options=("!debug")
source=(
  "${url}/releases/download/${_release_tag}/nym-vpn_${pkgver}-nightly.${pkgrel}_linux_x64"
  "nym-vpn.desktop"
  "nym-vpn.svg"
)
b2sums=('f223629fd7eefaafd007d7b63f4df28c39fd5540a6be1c64bd1d0c993d72ca7ce9644f41c4e45e2114e91592984024e1b61062342002b901b7a47d52909c7cf0'
        '06b6825c83001d825ae8d6a4d5020c52c82c6637ba4fb66ec546dc55aa30002c3c2503d0cc95850333810ec956450991fa8262962b93686e4155809b9bb11c5d'
        '793a5566db349f6d17c6d9a148c8dcfb32e62c8daf62752de938772c48f47c76db6d9175ff1de6d51dc9b15ca55a926d4361b3bf616fef5ce8dd8ce99d2f9596')

package() {
  install -Dm755 "nym-vpn_${pkgver}-nightly.${pkgrel}_linux_x64" "${pkgdir}/usr/bin/nym-vpn-app"
  install -Dm644 nym-vpn.desktop "${pkgdir}/usr/share/applications/nym-vpn.desktop"
  install -Dm644 nym-vpn.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/nym-vpn.svg"
}
