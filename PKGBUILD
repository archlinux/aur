# Maintainer: Changseo Jang <changseo.jang@korea.edu>
pkgname='pbkit'
pkgver='v0.0.22'
pkgrel=5
pkgdesc='Protobuf Dependency Manager'
arch=('x86_64')
url='https://github.com/pbkit/pbkit'
license=('MIT' 'APACHE')
depends=()
makedepends=('git' 'deno')
source=("pbkit::git://github.com/pbkit/pbkit.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  deno compile --unstable -A -o pollapo ./cli/pollapo/entrypoint.ts
  deno compile --unstable -A -o pb ./cli/pb/entrypoint.ts
}

package() {
  cd "$pkgname"

  install -Dm 755 pollapo -t "$pkgdir"/usr/bin
  install -Dm 755 pb -t "$pkgdir"/usr/bin
}
