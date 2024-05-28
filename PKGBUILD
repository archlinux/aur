# Maintainer: fuel <melodygoad18 at gmail dot com>
# Contributor: Lili1228 <aur at lili dot lgbt>
pkgname=pcbox-roms-git
pkgver=r684.gd34078ba9
pkgrel=2
pkgdesc='ROMs for the PCBox emulator'
arch=('any')
url='https://github.com/PCBox/roms'
license=('custom')
makedepends=('git')
options=('!strip')
provides=('86box-roms')
conflicts=('86box-roms')
source=("${pkgname}::git+https://github.com/PCBox/roms.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "${srcdir}/${pkgname}"
    install -d "$pkgdir/usr/share/PCBox/roms"
    cp -R [a-z]* "$pkgdir/usr/share/PCBox/roms"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
