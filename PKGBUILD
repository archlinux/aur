# Maintainer: Gavin Lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/cylon
pkgname=cylon
pkgver=6.1
pkgrel=2
pkgdesc="Updates, Maintenance, backup and system checks in a menu driven TUI written in Bash"
depends=('dialog' 'expac' 'pacman-contrib')
arch=('any')
url="https://github.com/gavinlyonsrepo/cylon"
license=('GPL')
optdepends=(
  'auracle-git: AUR helper'
  'trizen: AUR helper'
  'lostfiles: For finding lost files'
  'arch-audit: collect CVE data'
  'rmlint: Finds lint and other unwanted'
  'bleachbit: used for system clean'
  'gnu-netcat: used for checking network'
  'openbsd-netcat: used for checking network'
  'rsync: used for backup'
  'libnotify: desktop notifications'
)
source=("https://github.com/gavinlyonsrepo/cylon/archive/$pkgver.tar.gz")
sha256sums=('a4a06a4300181499bec37b1dbcad0365f09da0fa78aaf23915ac9d82f47a7d04')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m755 main/Cylon.sh "$pkgdir"/usr/bin/"${pkgname}" 

    install -D -m644 README.md "$pkgdir/usr/share/doc/${pkgname}/Readme.md"
    install -D -m644 documentation/cylon.7   "$pkgdir/usr/share/man/man7/cylon.7"
    install -D -m644 documentation/changelog.md "$pkgdir/usr/share/doc/${pkgname}/changelog.md"
    install -D -m644 documentation/package_lists.md "$pkgdir/usr/share/doc/${pkgname}/package_lists.md"
    install -D -m644 documentation/LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/License.md"
    
    install -D  -m644 desktop/cylon.desktop "$pkgdir/usr/share/applications/cylon.desktop"
    install -D  -m644 desktop/cylonicon.png "$pkgdir/usr/share/pixmaps/cylonicon.png"

    install -d  "$pkgdir"/usr/lib/cylon/modules
    install -D -m644  modules/*_module "$pkgdir"/usr/lib/cylon/modules
}
