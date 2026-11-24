# Maintainer: realazizk <https://github.com/realazizk>
# Prebuilt T3 Code libre: upstream T3 Code with product analytics off, no update feed,
# no T3 account / Connect relay, no phone-home lookups, and tailnet hostname pairing.
# The package is built and attested by GitHub Actions; verify it with:
#   gh attestation verify t3code-$pkgver-$_rel-x86_64.pkg.tar.zst -R realazizk/t3code-libre

pkgname=t3code-libre-bin
_pkgname=t3code
pkgver=0.1.11
_rel=1
pkgrel=1
pkgdesc='Desktop control surface for local coding agents (no telemetry, accounts, or cloud relay)'
arch=('x86_64')
url='https://github.com/realazizk/t3code-libre'
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libgcc'
  'libsecret'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'xdg-utils'
  'zlib'
)
provides=('t3code')
conflicts=('t3code' 't3code-bin' 't3code-git' 't3code-nightly-bin')
options=('!strip' '!debug')
install=t3code-libre-bin.install
source=("$_pkgname-$pkgver-$_rel-x86_64.pkg.tar.zst::$url/releases/download/v$pkgver-$_rel/$_pkgname-$pkgver-$_rel-x86_64.pkg.tar.zst")
noextract=("$_pkgname-$pkgver-$_rel-x86_64.pkg.tar.zst")
sha256sums=('bca4b026af7b6393be9c5d09ad10023e6e1e9e5d29d0e6970a2007c53cf1119f')

package() {
  bsdtar -xf "$_pkgname-$pkgver-$_rel-x86_64.pkg.tar.zst" -C "$pkgdir" --exclude '.*'
  mv "$pkgdir/usr/share/licenses/$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
}
