# Maintainer: Maxim Sheviakov <mrader3940@gmail.com>

pkgname='aswrap-git'
pkgver=r40.fa4435a
pkgrel=1
pkgdesc="Simple Python wrapper for Archlinux's ASP, git & makepkg"
arch=('any')
url='https://github.com/mradermaxlol/aswrapper'
license=('MIT')
depends=('python' 'asp')
makedepends=('git')
provides=('aswrap')
conflicts=('aswrap')
install='.INSTALL'
source=('git+https://github.com/mradermaxlol/aswrapper.git')
md5sums=('SKIP')

pkgver() {
    cd "aswrapper"
    _commit=$(git rev-list --count master)
    _hash=$(git rev-parse --short HEAD)
    echo "r$_commit.$_hash"
}

package() {
    cd "$srcdir/aswrapper"
    install -Dm755 "aswrap.py" "${pkgdir}/usr/bin/aswrap"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
