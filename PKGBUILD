# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

pkgname=jam-cli-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="CLI for reading and creating Jam bug reports (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://jam.dev/docs/cli"
license=('LicenseRef-Jam-Terms')
depends=('glibc')
optdepends=('xdg-utils: browser-based authentication')
provides=('jam-cli')
conflicts=('jam' 'jam-cli')
options=('!debug' '!strip')
source=("jam-terms.html::https://jam.dev/legal/terms")
source_x86_64=("$pkgname-$pkgver::https://native.jam.dev/download/linux/x64?version=$pkgver")
source_aarch64=("$pkgname-$pkgver::https://native.jam.dev/download/linux/arm64?version=$pkgver")
sha256sums=('3653db64c7b32a2ba8fe73ea11bd1aeffa12aac706bf234cb202b129f088799b')
sha256sums_x86_64=('2e3da24ee4601d1c466eb77247cb9783cfc98011fd9f345dc1d355828362bd28')
sha256sums_aarch64=('c461c21460090e20bacac2c773bca5dedb5e29a3d6faad7f84699749f272663c')

package() {
  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/jam"
  install -Dm644 jam-terms.html "$pkgdir/usr/share/licenses/$pkgname/TERMS.html"
}
