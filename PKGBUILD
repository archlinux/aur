# Maintainer: Gabriel Oliveira da Silva <glcbofs@proton.me>
pkgname=blindpaste
pkgver=1.1.3
pkgrel=1
pkgdesc="a TUI blackboard for quick note taking"
arch=("x86_64")
url="https://projectgrid.net/portfolio/blindpaste"
license=("0BSD")
makedepends=("git")
optdepends=(
  "bash-completion: for command line completions when pressing the <tab> key"
)
install="advice.install"
source=(
  "git+https://git.projectgrid.net/blindpaste.git"
  "LICENSE"
)
sha256sums=(
  "SKIP"
  "7056c04df17a4e0f0bac9f787f347c9cd892cee6323d1c89528090afd0b934a3"
)

build()
{
  cd "$pkgname"
  gcc $CFLAGS -o "$pkgname" blindpaste.c blindparse.c
}

package()
{
  cd "$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
