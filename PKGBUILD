# Maintainer: oscareczek <oscareczek at gmail dot com>
pkgname=86box-roms-git
pkgver=20220216.r0.gcb71dcf
pkgrel=1
pkgdesc='ROMs for the 86Box emulator.'
arch=('any')
url='https://github.com/86Box/roms'
license=('custom')
makedepends=('git')
options=('!strip')
provides=('86box-roms')
conflicts=('86box-roms')
source=("${pkgname}::git+https://github.com/86Box/roms.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${pkgname}"
    install -d "$pkgdir/usr/share/86box/roms"
    cp -R [a-z]* "$pkgdir/usr/share/86box/roms"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
