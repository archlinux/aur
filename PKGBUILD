# Maintainer: ThecaTTony <thecattony at gmx dot com>

pkgname=crunch
pkgver=3.6
pkgrel=1
pkgdesc="A wordlist generator where you can specify a standard character set or a character set you specify and generate all possible combinations and permutations."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/crunch-wordlist/"
license=('GPL2')
source=(http://downloads.sourceforge.net/project/crunch-wordlist/crunch-wordlist/${pkgname}-${pkgver}.tgz)
md5sums=('1cbab783805d1bd382bd2edf33298108')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr
}

package() {
install -Dm755 "${srcdir}"/"${pkgname}"-"${pkgver}"/"${pkgname}" \
               "${pkgdir}"/usr/bin/"${pkgname}"
install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/charset.lst \
               "${pkgdir}"/usr/share/"${pkgname}"/charset.lst
install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/COPYING \
               "${pkgdir}"/usr/share/doc/"${pkgname}"/COPYING
install -Dm644 "${srcdir}"/"${pkgname}"-"${pkgver}"/crunch.1 \
               "${pkgdir}"/usr/share/man/man1/crunch.1
}
