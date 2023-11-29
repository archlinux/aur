# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=hunspell-vi-git
provides=('hunspell-vi')
conflicts=('hunspell-vi')
pkgver=2.2.0.r35.g507d07e
pkgrel=2
pkgdesc="Vietnamese dictionaries for Hunspell"
arch=('x86_64')
url="https://github.com/1ec5/hunspell-vi.git"
license=('GPL3')
depends=('hunspell')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/hunspell-vi"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/hunspell-vi/dictionaries"

    install -D -m644 "vi-DauCu.dic" "${pkgdir}/usr/share/hunspell/vi_VN-old.dic"
    install -D -m644 "vi-DauCu.aff" "${pkgdir}/usr/share/hunspell/vi_VN-old.aff"

    install -D -m644 "vi-DauMoi.dic" "${pkgdir}/usr/share/hunspell/vi_VN-new.dic"
    install -D -m644 "vi-DauMoi.aff" "${pkgdir}/usr/share/hunspell/vi_VN-new.aff"
}
