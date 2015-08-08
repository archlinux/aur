# Maintainer: Attila Bukor <r1pp3rj4ck@w4it.eu>
# Contributor: Kirill Duborenko <k.duborenko@gmail.com>

pkgname=robomongo
pkgver=0.8.4
pkgrel=2
pkgdesc="Shell-centric crossplatform opensource MongoDB management tool."
arch=('i686' 'x86_64')
url="http://www.robomongo.org/"
license=('GPL3')
depends=("qt4" "pcre" "qjson" "qscintilla")
if [[ "$CARCH" == "x86_64" ]]; then
  source=("http://robomongo.org/files/linux/robomongo-${pkgver}-x86_64.tar.gz")
  md5sums=("a62865855d223ecf69db53c9a18ab73c")
  iarch='x86_64'
elif [[ "$CARCH" == "i686" ]]; then
  source=("http://robomongo.org/files/linux/robomongo-${pkgver}-i386.tar.gz")
  md5sums=("67fcd67001fdd6771670af2e8520c0d6")
  iarch='i386'
fi

package() {
  install -d -m 755 "${pkgdir}/usr/"{share,bin}
  cp -a "${srcdir}/robomongo-${pkgver}-${iarch}/" "${pkgdir}/usr/share/robomongo"

  ln -s /usr/share/robomongo/bin/robomongo.sh "${pkgdir}/usr/bin/robomongo"

  install -D -m 644 "${pkgdir}/usr/share/robomongo/share/applications/robomongo.desktop" "${pkgdir}/usr/share/applications/robomongo.desktop"
  install -D -m 644 "${pkgdir}/usr/share/robomongo/share/icons/robomongo.png" "${pkgdir}/usr/share/pixmaps/robomongo.png"
  install -D -m 644 "${srcdir}/robomongo-${pkgver}-${iarch}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# vim:set ts=2 sw=2 et:
