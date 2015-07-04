# Maintainer: tuftedocelot@fastmail.fm
_pkgname=dswitcher
pkgname=${_pkgname}-git
pkgver=10
pkgrel=2
pkgdesc='Dmenu-based window switcher for EWHM-compliant X11 window managers'
arch=('any')
url="https://github.com/Antithesisx/dswitcher"
license='GPLv3'
depends=('wmctrl' 'dmenu')
makedepends=('git')
source=("git://github.com/Antithesisx/dswitcher.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

package() {
    install -Dm 755 "$srcdir/$_pkgname/$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
    install -D -m644 "$srcdir/$_pkgname/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
