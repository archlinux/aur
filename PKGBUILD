# Maintainer: Oguz Bektas <xorond@gmail.com>

pkgname=archstrike-setuptool-git
pkgver=20160712.r15
pkgrel=1
arch=('any')
pkgdesc="Command line installer for ArchStrike penetration testing layer"
url="https://github.com/xorond/archstrike-setuptool"
license=('GPL3')
depends=('bash')
makedepends=('git')
source=("$pkgname::git+https://github.com/xorond/archstrike-setuptool.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.r%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)"
}

package() {
  cd ${pkgname}
  install -dm755 "${pkgdir}/usr/bin"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
            
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm755 archstrike-setuptool.sh "${pkgdir}/usr/bin/archstrike-setuptool"
  chmod 755 "${pkgdir}/usr/bin/archstrike-setuptool"
}

