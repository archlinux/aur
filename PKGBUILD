# Maintainer: Bingjin Han <bhan729@connect.hkust-gz.edu.cn>
pkgname=amulet2-git
pkgver=r23.cff5957
pkgrel=1
pkgdesc="AMulet 2.2 - AIG Multiplier Examination Tool (Verify and certify integer multipliers)"
arch=('x86_64')
url="https://github.com/d-kfmnn/amulet2"
license=('MIT')
depends=('gmp')
makedepends=('git' 'make')
provides=("amulet")
conflicts=("amulet")
source=("git+https://github.com/d-kfmnn/amulet2.git")
md5sums=('SKIP')

pkgver() {
  cd "amulet2"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "amulet2"
  ./configure.sh
  make
}

package() {
  cd "amulet2"
  install -Dm755 amulet "${pkgdir}/usr/bin/amulet"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
