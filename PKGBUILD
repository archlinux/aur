# Maintainer: oscareczek <oscareczek at gmail dot com>
pkgname=86box-roms
_date=20220701
pkgver=3.6
pkgrel=1
pkgdesc='ROMs for the 86Box emulator.'
arch=('any')
url='https://github.com/86Box/roms'
license=('custom')
options=('!strip')
source=("roms.tgz::https://github.com/86Box/roms/archive/refs/tags/${_date}.tar.gz")
sha512sums=('4a325a30316ff81eb0e25aa8aec7a4c76ca2a450aff079c7d8714edaa71fabc7fd2dfebb469122a3517f4ece02468e5edd8b9d73209b06679fb5507c0d9fbaee')

package() {
    cd "${srcdir}/roms-$_date"
    install -d "$pkgdir/usr/share/86Box/roms"
    cp -R [a-z]* "$pkgdir/usr/share/86Box/roms"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
