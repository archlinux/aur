# Maintainer: oscareczek <oscareczek at gmail dot com>
pkgname=86box-roms
_date=20220216
pkgver=3.2
pkgrel=1
pkgdesc='ROMs for the 86Box emulator.'
arch=('any')
url='https://github.com/86Box/roms'
license=('custom')
options=('!strip')
source=("https://github.com/86Box/roms/archive/refs/tags/${_date}.tar.gz")
sha512sums=('f0b9ef712d923588cf77c8b3cac9b0ce400b79307f686c24d7826a0312943b3ce0f736d16b66fd4477dbef222a95c8ba7dae09c2613b46d28276fbebc7ecd740')

package() {
    cd "${srcdir}/roms-${_date}"
    install -d "$pkgdir/usr/share/86box/roms"
    cp -R [a-z]* "$pkgdir/usr/share/86box/roms"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
