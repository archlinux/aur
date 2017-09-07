# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=clerk-git
_pkgname=clerk
pkgver=944.0bbc0b7
pkgrel=1
conflicts=('clerk')
provides=('clerk')
pkgdesc="rofi/fzf driven mpd client"
arch=('any')
url='https://github.com/carnager/clerk'
license=('GPL')
depends=('perl' 'rofi' 'tmux' 'perl-inc-latest' 'perl-net-mpd' 'perl-data-messagepack' 'perl-file-slurper' 'perl-file-path' 'perl-config-simple' 'perl-try-tiny' 'perl-ipc-run' 'perl-http-date' 'perl-local-lib')
makedeps=('perl-module-scandeps' 'perl-module-install' 'perl-cpanplus-dist-build')
install=clerk-git.install
makedepends=('git' 'perl-module-install')
source=('git+https://github.com/carnager/clerk#branch=perl')

pkgver() {
    cd ${_pkgname}
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -D -m 755 ${srcdir}/clerk/clerk "${pkgdir}/usr/bin/clerk"
    install -D -m 755 ${srcdir}/../clerk_setup "${pkgdir}/usr/bin/clerk_setup"
    install -D -m 644 ${srcdir}/clerk/clerk.conf "${pkgdir}/usr/share/doc/clerk/clerk.conf"
    install -D -m 644 ${srcdir}/clerk/clerk.tmux "${pkgdir}/usr/share/doc/clerk/clerk.tmux"
}
md5sums=('SKIP')
