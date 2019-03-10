# Maintainer: Jaja <jaja@mailbox.org>
#

pkgname=languagetool-ngrams-es
pkgver=20150915
pkgrel=2
pkgdesc="Finding errors using n-gram data, spanish text"
arch=('any')
url="http://wiki.languagetool.org/finding-errors-using-n-gram-data"
license=('CCPL')
optdepends=('languagetool: system wide installation of LT'
'libreoffice-extension-languagetool: standalone LT for LibreOffice'
'openoffice-extension-languagetool: standalone LT for OpenOffice')
makedepends=('unzip')
install=${pkgname}.install
source=(${pkgname}-${pkgver}.zip::"https://languagetool.org/download/ngram-data/ngrams-es-${pkgver}.zip")
noextract=(${pkgname}-${pkgver}.zip)
md5sums=('ebaa97d32d773fca0179f0517e45306f')
PKGEXT='.pkg.tar'
options=(!strip)

prepare() {
  echo ''
  echo 'Warning:'
  echo '· This package requires about 3.1G to be available within /usr/share.'
  echo '· Make sure you have a _fast_ disk serving /usr/share, i.e. an SSD. Without an SSD, using this data can make LanguageTool much slower.'
  echo '· Because of size, you may run out of RAM if you use tmpfs aware aur helpers.'
  echo ''
}

package() {
  install -d "${pkgdir}"/usr/share/ngrams
  unzip -q "${srcdir}"/${pkgname}-${pkgver}.zip -d "${pkgdir}"/usr/share/ngrams
}
