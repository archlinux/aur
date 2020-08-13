# Maintainer: Mikael Blomstrand <gmail.com: kmbloms>

pkgname=dduper-bin
provides=('dduper')
conflicts=('dduper')
_gitver=v0.04
pkgver=0.04
pkgrel=1
pkgdesc="Fast block-level out-of-band BTRFS deduplication tool."
arch=('x86_64')
url='https://github.com/Lakshmipathi/dduper'
license=('GPL2')
depends=('python-numpy' 'python-ptable')
source=("https://raw.githubusercontent.com/Lakshmipathi/dduper/${_gitver}/bin/btrfs.static"
        "https://raw.githubusercontent.com/Lakshmipathi/dduper/${_gitver}/dduper")

sha1sums=('6c3ca140589221f5d7f9dd97f8df01045051bf00'
          '9fad3be2a460b48d793d914264a41e9a8856dea3')
sha256sums=('38a24538d42fe141ff10036c0ef714fd74bd0ca8f11d5a714bdb2aac4de6d8cb'
            '53b55de698586ff04fdd5da560d0e9fd57be310811881c4040a1d65107d85a36')
sha512sums=('3e65a4c98ba14b7cc18ca51e13c22e0cb45937660352b016532a41e60f771461292cc6792cd58294f23f3fa78ddc0e8ae23575e93a14a1c482e83d2a2fe456d6'
            'f4e527f6078e4a0e09638a5b5047f9b2b22eb118c3d1b363a387cd1f85bcee7877a25f0e189be78cb69641b678b35758348a0a7fc3b81ab4bd93884435407b34')

pkgver() {
    echo "${_gitver}" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
    cd "${srcdir}"
    install -Dm 755 "dduper" "${pkgdir}/usr/bin/dduper"
    install -Dm 755 "btrfs.static" "${pkgdir}/usr/bin/btrfs.static"
}
