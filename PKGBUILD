# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>

pkgname="dracut-hook"
pkgver=0.3
pkgrel=2
pkgdesc="dracut hook for archlinux"
arch=('any')
url="https://tackitt.net"
license=('BSD')
depends=('dracut')
noextract=()
source=(
  "dracut-install"
  "dracut-remove"
  "90-dracut-install.hook"
  "90-dracut-remove.hook"
)
md5sums=('ca2782fe7bd5e5ec01ba1043df8db092'
         'd47474311fe65faf9358727f75526389'
         '8fa0ed0a9aa50f2ac6525d3264f04d76'
         '679dbd817343d459252225000d71ec52')

package() {
  install -Dm755 "$srcdir/90-dracut-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-install.hook"
  install -Dm755 "$srcdir/90-dracut-remove.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-remove.hook"
  install -Dm755 "$srcdir/dracut-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-install"
  install -Dm755 "$srcdir/dracut-remove"         "${pkgdir}/usr/share/libalpm/scripts/dracut-remove"
}
