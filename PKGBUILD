# Maintainer: Gavin Lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/cylon
pkgname=cylon
pkgver=6.3
pkgrel=4
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
  'libnotify: desktop notifications'
)
source=("https://github.com/gavinlyonsrepo/cylon/archive/$pkgver.tar.gz")
sha256sums=('1cb37baf672203a1a3fe28c021de546cf14c7c0261cf3e7867607e93d5f8f70e')

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
