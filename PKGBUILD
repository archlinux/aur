# Maintainer: hotline1337 <denuvo at tuta dot io>

pkgname=nym-vpn-app-beta-bin
_dlver=2026.12.4
pkgver=2026.12.4
pkgrel=1
_release_tag="nym-vpn-v${_dlver}"
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
  "nym-vpn-app-bin-x86_64::${url}/releases/download/${_release_tag}/nym-vpn_${_dlver}_linux_x64"
  "nym-vpn.desktop"
  "nym-vpn.svg"
)
source_aarch64=(
  "nym-vpn-app-bin-aarch64::${url}/releases/download/${_release_tag}/nym-vpn_${_dlver}_linux_arm64"
  "nym-vpn.desktop"
  "nym-vpn.svg"
)
b2sums_x86_64=('05bbf8577aaa930c763feac88f8c36d1ab3ed6a13fe25bb5fa5749c96e3e2f9e9b52d32309b7e0242b7a6ebfd9dd29da4ebb45da71e985a5976a779e2d8192d9'
               '06b6825c83001d825ae8d6a4d5020c52c82c6637ba4fb66ec546dc55aa30002c3c2503d0cc95850333810ec956450991fa8262962b93686e4155809b9bb11c5d'
               '793a5566db349f6d17c6d9a148c8dcfb32e62c8daf62752de938772c48f47c76db6d9175ff1de6d51dc9b15ca55a926d4361b3bf616fef5ce8dd8ce99d2f9596')
b2sums_aarch64=('21308794db764bf162f78001da496af87661a908f59e51da6b3bdd2defb06103b6b01ec2f2c576d65364ffa1f5986000738eb85cb8b2ae73abbd66a99e49ea06'
                '06b6825c83001d825ae8d6a4d5020c52c82c6637ba4fb66ec546dc55aa30002c3c2503d0cc95850333810ec956450991fa8262962b93686e4155809b9bb11c5d'
                '793a5566db349f6d17c6d9a148c8dcfb32e62c8daf62752de938772c48f47c76db6d9175ff1de6d51dc9b15ca55a926d4361b3bf616fef5ce8dd8ce99d2f9596')

package() {
  install -Dm755 "nym-vpn-app-bin-${CARCH}" "${pkgdir}/usr/bin/nym-vpn-app"
  install -Dm644 nym-vpn.desktop "${pkgdir}/usr/share/applications/nym-vpn.desktop"
  install -Dm644 nym-vpn.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/nym-vpn.svg"
}
