# Maintainer:
#Contributor: FabioLolix
#Contributor: Brli
#Contributor: Tinxy <arch ät tinx døt eu>

pkgname=droopy-git
pkgver=r143.c8b2534
pkgrel=2
epoch=1
pkgdesc="Mini Web server that let others upload files to your computer"
url='https://github.com/Brli/Droopy'
arch=(any)
license=(BSD)
depends=(python)
makedepends=(git)
provides=(droopy)
conflicts=(droopy)
source=("${pkgname/-git}::git+https://github.com/Brli/Droopy.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname/-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname/-git}"
  install -Dm755 droopy "${pkgdir}/usr/bin/droopy"
  install -Dm644 man/droopy.1.gz "${pkgdir}/usr/share/man/man1/droopy.1.gz"
  install -D Readme.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
