# Maintainer: Cullen Ross <cullenrss@gmail.com>
# Contributor: Andrew Rabert <draje@nullsum.net>

_pkgname=urxvt-config-reload
pkgname=${_pkgname}-git
pkgver=r5.72f3846
pkgrel=1
pkgdesc='Reload urxvt configuration'
arch=('any')
url="https://github.com/qualiaa/${_pkgname}"
depends=('rxvt-unicode' 'perl-common-sense' 'perl-linux-fd')
makedepends=('git')
provides=('urxvt-config-reload')
conflicts=('urxvt-config-reload')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/qualiaa/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -D -m755 config-reload "$pkgdir/usr/lib/urxvt/perl/config-reload"
}
