# Maintainer: Gavin Lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/cylon
pkgname=cylon
pkgver=6.5.0
pkgrel=1
pkgdesc="Updates, Maintenance, backup and system checks in a menu driven TUI written in Bash"
depends=('dialog' 'expac' 'pacman-contrib')
arch=('any')
url="https://github.com/gavinlyonsrepo/cylon"
license=('GPL-3.0-or-later')
optdepends=(
  'auracle-git: AUR helper'
  'trizen: AUR helper'
  'lostfiles: For finding lost files'
  'arch-audit: collect CVE data'
  'rmlint: Finds lint and other unwanted'
  'bleachbit: used for system clean'
  'gnu-netcat: used for checking network'
  'openbsd-netcat: used for checking network'
  'libnotify: desktop notifications'
)
source=("https://github.com/gavinlyonsrepo/cylon/archive/$pkgver.tar.gz")
sha256sums=('07fe6244d055f455ca44c20647f7d2dd14841b0b2a7179cc6b99f91e03766ab0')

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m755 main/Cylon.sh "$pkgdir"/usr/bin/"${pkgname}" 

    install -d  "$pkgdir"/usr/lib/cylon/modules
    install -D -m644  modules/*_module "$pkgdir"/usr/lib/cylon/modules
    
    install -d  "$pkgdir"/usr/share/doc/"${pkgname}"
    install -D -m644 README.md "$pkgdir/usr/share/doc/${pkgname}/Readme.md"
    install -D -m644 documentation/help/*.md "$pkgdir/usr/share/doc/${pkgname}/"
    
    install -D -m644 documentation/help/cylon.7   "$pkgdir/usr/share/man/man7/cylon.7"
    install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/${pkgname}/License.md"
    
    install -D  -m644 desktop/cylon.desktop "$pkgdir/usr/share/applications/cylon.desktop"
    install -D  -m644 desktop/cylonicon.png "$pkgdir/usr/share/pixmaps/cylonicon.png"

}
