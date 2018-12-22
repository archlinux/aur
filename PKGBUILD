# Contributor: Alexandre Bolelli <semeion7@hotmail.com>
# Maintainer: Alexandre Bolelli <semeion7@hotmail.com>

pkgname=handshake-cracker
pkgver=59.0f38df4
pkgrel=1
pkgdesc="Capture handshakes with aircrack-ng, crack with hashcat using john the ripper mangled wordlists."
arch=('any')
url='https://github.com/semeion/handshake-cracker'
license=('GPL3')
depends=('aircrack-ng' 'hcxtools' 'hashcat' 'mdk3' 'xterm' 'ncurses' 'psmisc' 'gawk'
         'macchanger' 'coreutils' 'glibc' 'sed' 'gzip' 'bzip2' 'unzip' 'wget' 'sudo' 'less' 'john' 'python2' 'python2-lxml')
#optdepends=('hcxdumptool')
makedepends=('git')
source=('git+https://github.com/semeion/handshake-cracker.git')
sha256sums=('SKIP') # use 'updpkgsums' if you want

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package()
{
    cd "${srcdir}/${pkgname}"
    # Install script
    install -D -m755 crack "${pkgdir}/usr/bin/crack"
    install -D -m755 crawler-dicionarioinformal "${pkgdir}/usr/bin/crawler-dicionarioinformal"
    install -D -m755 crawler-dictionary "${pkgdir}/usr/bin/crawler-dictionary"
    install -D -m755 handshake "${pkgdir}/usr/bin/handshake"
    install -D -m755 wordlist "${pkgdir}/usr/bin/wordlist"
    # Install john config with custom rules
    install -D -m644 john.conf.custom "${pkgdir}/etc/john/john.conf.custom"
}
