# Maintainer: voider755 <voider (at) disroot.org>
# AUR Package Maintainer: lxgr <lxgr@protonmail.com>

pkgname=almh-git
pkgver=r50.32078a1
pkgrel=1
pkgdesc="Gives you a CLI menu with some common maintenance options inside an Arch Linux system"
arch=(any)
url="https://github.com/voider755/almh"
license=('BSD')
depends=('python' 'sudo')
makedepends=('git')
optdepends=("newsboat: News support" "pacman-contrib: For options 3 and 7")
source=("$pkgname"::'git+https://github.com/voider755/almh')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin" "almh.py"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
