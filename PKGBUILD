# Maintainer: Mikael Blomstrand <gmail.com: kmbloms>

pkgname=dduper-bin
provides=('dduper')
conflicts=('dduper')
_gitver=v0.01-7-gb703d79
pkgver=0.01.r7.gb703d79
pkgrel=1
pkgdesc="Fast block-level offline BTRFS deduplication tool."
arch=('x86_64')
url='https://github.com/Lakshmipathi/dduper'
license=('GPL2')
depends=('python-numpy' 'python-ptable')
source=("https://github.com/Lakshmipathi/dduper/raw/${_gitver}/bin/btrfs.static"
        "https://raw.githubusercontent.com/Lakshmipathi/dduper/${_gitver}/dduper")

sha1sums=('6c3ca140589221f5d7f9dd97f8df01045051bf00'
          '2bb7b578f94a1f37d304bd79aa9dcb0916405d42')
sha256sums=('38a24538d42fe141ff10036c0ef714fd74bd0ca8f11d5a714bdb2aac4de6d8cb'
            'dc26e0791b9b4e772d87f1efcd97b1fd6eda90a3e6f0f1f6253f86ddb521edc8')
sha512sums=('3e65a4c98ba14b7cc18ca51e13c22e0cb45937660352b016532a41e60f771461292cc6792cd58294f23f3fa78ddc0e8ae23575e93a14a1c482e83d2a2fe456d6'
            'd97dc80dfa803ecee5020e89cd70755800fb5b85a58c0d7931d9ca4e33ff8c1d5a134541704c768d3eff0561604e9ed07dd186ae533f1ef63a0408135717e804')

pkgver() {
    echo "${_gitver}" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
    cd "${srcdir}"
    install -Dm 755 "dduper" "${pkgdir}/usr/bin/dduper"
    install -Dm 755 "btrfs.static" "${pkgdir}/usr/bin/btrfs.static"
}
