# Maintainer: Papajoker <papajoker [at] archlinux [dot] info>
pkgname=pacman-diffs
pkgver=1.1.0
pkgrel=6
url=(https://github.com/papajoker/pacman-diffs)
pkgdesc="finding .pacnew files, compare and archive"
arch=('any')
license=('GPL')
depends=('findutils' 'diffutils')
optdepends=('diffuse: graphical editor[community]'
        'kompare: kde editor [extra]'
        'gksu: gnome gui for su'
        'kde-cli-tools: kde gui for su')
source=("$pkgname::git+http://github.com/papajoker/$pkgname#branch=master")
backup=('etc/pacman.d/pacman-diffs.conf')
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 ./${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -dm755 ${pkgdir}/var/cache/pacman/pacnew/
  install -Dm644 ./${pkgname}.fr ${pkgdir}/usr/share/locale/fr/LC_MESSAGES/${pkgname}
  install -Dm644 ./${pkgname}.conf ${pkgdir}/etc/pacman.d/${pkgname}.conf
}
