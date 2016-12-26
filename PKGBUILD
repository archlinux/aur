# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/cylon
pkgname=cylon
pkgver=3.2
pkgrel=3
pkgdesc="Updates, Maintenance, backup and system checks in a menu driven Bash script"
arch=('any')
url="https://github.com/gavinlyonsrepo/cylon"
license=('GPL')
optdepends=(
  'cower: AUR package for AUR work'
  'gdrive: AUR package for google drive backup'
  'lostfiles: AUR package for finding lost files'
  'pacaur: AUR helper'
  'arch-audit: AUR package collect CVE data'
  'rmlint: Finds lint and other unwanted'
  'rkhunter: finds root kits malware'
  'clamav: used for finding malware'
  'bleachbit: used for system clean'
  'gnu-netcat: used for checking network'
  'ccrypt: used for encrypting'
  'rsync: used for backup'
  'inxi: system information viewer'
  'htop: interactive process viewer'
  'wavemon: wireless network monitor'
  'speedtest-cli: internet bandwidth'
  'lynis: system audit tool'
  'openbsd-netcat: used for checking network'
)
source=("https://github.com/gavinlyonsrepo/cylon/archive/$pkgver.tar.gz")

md5sums=('76d4a28cda5d27256d1a7a6a00cb3e2c')
package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -D -m755 Cylon.sh "$pkgdir"/usr/bin/"${pkgname}" 
    install -D -m644 Readme.md "$pkgdir/usr/share/doc/${pkgname}/Readme.md"
    install -D -m644 cylon.7   "$pkgdir/usr/share/man/man7/cylon.7"
    install -D -m644 changelog.md "$pkgdir/usr/share/doc/${pkgname}/changelog.md"
    install -D -m644 License.md "$pkgdir/usr/share/licenses/${pkgname}/License.md"
    install -D  -m644 cylon.desktop "$pkgdir/usr/share/applications/cylon.desktop"
    install -D  -m644 cylonicon.png "$pkgdir/usr/share/pixmaps/cylonicon.png"
    install -d  "$pkgdir"/usr/lib/cylon/modules
    install -D -m644  modules/*_module "$pkgdir"/usr/lib/cylon/modules
}
