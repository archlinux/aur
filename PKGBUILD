# Maintainer: Gabriel Oliveira da Silva <glcbofs@proton.me>
pkgname=blindpaste
pkgver=1.1.2
pkgrel=1
pkgdesc="a terminal blackboard for quick note taking"
arch=("x86_64")
url="https://gabrieldigitprint.work/ff/portfolio/blindpaste"
license=("0BSD")
makedepends=("git")
optdepends=(
  "bash-completion: for command line completions when pressing the <tab> key"
)
install="advice.install"
source=("git+https://gabrieldigitprint.work/git/blindpaste.git")
sha256sums=('SKIP')

build()
{
  cd "$pkgname"
  gcc $CFLAGS -o "$pkgname" blindpaste.c blindparse.c
}

package()
{
  cd "$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
