# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Changseo Jang <changseo.jang@korea.edu>
pkgname='pbkit'
pkgver='v0.0.22'
pkgrel=3
epoch=
pkgdesc='Protobuf Dependency Manager'
arch=('x86_64')
url=''
license=('MIT' 'APACHE')
groups=()
depends=()
makedepends=('git' 'deno')
checkdepends=()
optdepends=()
provides=('pollapo' 'pb')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("pbkit::git://github.com/pbkit/pbkit.git#tag=${pkgver}")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

package() {
  mkdir -p "${pkgdir}/usr/bin"
  deno compile -f --unstable -A -o pollapo "$srcdir/pbkit/cli/pollapo/entrypoint.ts"
  cp "${srcdir}/pollapo" "${pkgdir}/usr/bin/pollapo"
  deno compile -f --unstable -A -o pb "$srcdir/pbkit/cli/pb/entrypoint.ts"
  cp "${srcdir}/pb" "${pkgdir}/usr/bin/pb"
}
