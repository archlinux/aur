# Maintainer: Rasmus Steinke <rasi at xssn dot at>

pkgname=clerk-git
_pkgname=clerk
pkgver=940.1bf0d30
pkgrel=1
conflicts=('clerk')
provides=('clerk')
pkgdesc="rofi/fzf driven mpd client"
arch=('any')
url='https://github.com/carnager/clerk'
license=('GPL')
depends=('perl' 'perl-net-mpd' 'perl-cpanplus-dist-build' 'perl-data-messagepack' 'perl-file-slurper' 'perl-file-path' 'perl-config-simple' 'perl-try-tiny' 'perl-ipc-run' 'perl-http-date' 'perl-local-lib')
install=clerk-git.install
makedepends=('git')
source=('git+https://github.com/carnager/clerk#branch=perl')

pkgver() {
    cd ${_pkgname}
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}
    install -D -m 755 ${srcdir}/clerk/clerk "${pkgdir}/usr/bin/clerk"
    install -D -m 644 ${srcdir}/clerk/clerk.conf "${pkgdir}/usr/share/doc/clerk/clerk.conf"
    install -D -m 644 ${srcdir}/clerk/clerk.tmux "${pkgdir}/usr/share/doc/clerk/clerk.tmux"
}
md5sums=('SKIP')
