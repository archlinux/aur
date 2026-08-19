# Maintainer: hotline1337 <denuvo at tuta dot io>

pkgname=nym-vpn-app-beta-bin
pkgver=2026.12.1
pkgrel=1
_release_tag="nym-vpn-v${pkgver}-beta.${pkgrel}"
pkgdesc="NymVPN desktop client (Beta)"
arch=("x86_64" "aarch64")
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
source_x86_64=(
  "nym-vpn-app-bin-x86_64::${url}/releases/download/${_release_tag}/nym-vpn_${pkgver}-beta.${pkgrel}_linux_x64"
  "nym-vpn.desktop"
  "nym-vpn.svg"
)
source_aarch64=(
  "nym-vpn-app-bin-aarch64::${url}/releases/download/${_release_tag}/nym-vpn_${pkgver}-beta.${pkgrel}_linux_arm64"
  "nym-vpn.desktop"
  "nym-vpn.svg"
)
b2sums_x86_64=('23631e33f78827bbd48388a19d8fe1040d64d3e951b4e59bd4de52a860cc4d04b4236a994ccc4934df30f10ec2844bfb9bcb06680d7a8ef42dbca62d14f3191c'
               '06b6825c83001d825ae8d6a4d5020c52c82c6637ba4fb66ec546dc55aa30002c3c2503d0cc95850333810ec956450991fa8262962b93686e4155809b9bb11c5d'
               '793a5566db349f6d17c6d9a148c8dcfb32e62c8daf62752de938772c48f47c76db6d9175ff1de6d51dc9b15ca55a926d4361b3bf616fef5ce8dd8ce99d2f9596')
b2sums_aarch64=('28bcc93eaff98a22fcf8358f29bbd7f639b38b3d760816990f1c27e7acab7da7ad1ac422b10de2fd732a9e8175f52dcf49a61cbeb4fa3ec5ad3374caf944a61c'
                '06b6825c83001d825ae8d6a4d5020c52c82c6637ba4fb66ec546dc55aa30002c3c2503d0cc95850333810ec956450991fa8262962b93686e4155809b9bb11c5d'
                '793a5566db349f6d17c6d9a148c8dcfb32e62c8daf62752de938772c48f47c76db6d9175ff1de6d51dc9b15ca55a926d4361b3bf616fef5ce8dd8ce99d2f9596')

package() {
  install -Dm755 "nym-vpn-app-bin-${CARCH}" "${pkgdir}/usr/bin/nym-vpn-app"
  install -Dm644 nym-vpn.desktop "${pkgdir}/usr/share/applications/nym-vpn.desktop"
  install -Dm644 nym-vpn.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/nym-vpn.svg"
}
