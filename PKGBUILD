# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz-git
pkgver=r50.6150fb3
pkgrel=1
pkgdesc="boot environment manager for ZFS"
arch=(any)
url="https://gitlab.com/m_zhou/bieaz"
license=('GPLv3+')
depends=('coreutils' 'awk' 'sed' 'grep' 'sh' 'grub')
backup=('etc/bieaz.cfg' )
source=(
        "bieaz-git::git+https://gitlab.com/m_zhou/bieaz"
)
package() {
        cd "${pkgname}"
        make DESTDIR="$pkgdir" install
}
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
