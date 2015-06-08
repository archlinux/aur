# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Roman Kreisel <roman.kreisel@epost.de>
# Contributor: damir <damir@archlinux.org>

pkgname=ding
pkgver=1.8
pkgrel=1
pkgdesc="A Dictionary Lookup program and EN<->DE Dictionary"
arch=('any')
license=('GPL')
url="http://www-user.tu-chemnitz.de/~fri/ding"
depends=('sh' 'tk' 'tre' 'aspell')
source=(http://ftp.tu-chemnitz.de/pub/Local/urz/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('93ce724031f57efe43bd0197dbb3800c')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -d "${pkgdir}/usr/share/dict"
  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m755 -d "${pkgdir}/usr/share/applications"
  install -m755 -d "${pkgdir}/usr/share/pixmaps"

  sed -i -e 's/ger-en.txt/de-en.txt/g' ding

  install -m755 ding "${pkgdir}/usr/bin/"
  install -m644 ding.1 "${pkgdir}/usr/share/man/man1/"
  install -m644 de-en.txt "${pkgdir}/usr/share/dict/"
  install -m644 ding.png "${pkgdir}/usr/share/pixmaps/"
  install -m644 ding.desktop "${pkgdir}/usr/share/applications/"
}
