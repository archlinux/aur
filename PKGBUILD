# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=toolkit
pkgver=0.1.1
pkgrel=1
pkgdesc="A toolbox for the CLI, rapidly speeding up file editing and data management processes."
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(bat ruby)
optdepends=('nvim: the recommended editor for power users')
conflicts=(qed)
source=(
  "https://software.concise.cc/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  '0303a2ba47a3926c3ec2d928948fe10eaf27bfddd7402a31a291780a8124853ad1bfcf28ccde8be4543ddc46615fa59db67436324c7784ac4cdba9eecdc8da5f'
)
md5sums=(
  '5b35607a0a9fcb153f61f182059b8a04'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}" ||
  cd "$srcdir/${pkgname}"

  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin"
}
