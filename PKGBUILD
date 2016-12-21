# Maintainer: bitwave < aur aTt oomlu d0t de>
# Contributor: Peter Hoeg <first name at last name dot com>

pkgname=jdupes
pkgver=1.6
pkgrel=1
pkgdesc="jdupes is a program for identifying duplicate files residing within specified directories"
arch=('i686' 'x86_64')
url="https://github.com/jbruchon/jdupes/"
license=('MIT')
depends=('glibc')
provides=('jdupes')
conflicts=('fdupes-jody-git')
source=("${pkgname}-${pkgver}.zip::${url}/archive/v${pkgver}.zip"
        "LICENSE")
sha256sums=('52a01dadd6b7a7c621aab7ff2d51b9cec4413b9e3a4754fd2f573545c25a412d'
            'ff95e2262ce1dd788e66c6c8763354e350a46044b8532d92146b7b03a319481a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}"/usr/{share/man/man1,bin}
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=2 sw=2 et:
