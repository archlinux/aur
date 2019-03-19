# Maintainer: Jaja <jaja@mailbox.org>
#

pkgname=languagetool-ngrams-he
pkgver=20150916
pkgrel=1
pkgdesc="Finding errors using n-gram data, hebrew text"
arch=('any')
url="http://wiki.languagetool.org/finding-errors-using-n-gram-data"
license=('CCPL')
optdepends=('languagetool: system wide installation of LT'
'libreoffice-extension-languagetool: standalone LT for LibreOffice'
'openoffice-extension-languagetool: standalone LT for OpenOffice')
install=${pkgname}.install
source=(${pkgname}-${pkgver}.zip::"https://languagetool.org/download/ngram-data/untested/ngram-he-${pkgver}.zip")
md5sums=('673416fdb6010e390ded7a521cbab553')
PKGEXT='.pkg.tar'
options=(!strip)

prepare() {
  echo ''
  echo 'Warning:'
  echo '· This package requires about 423M to be available within /usr/share.'
  echo '· Make sure you have a _fast_ disk serving /usr/share, i.e. an SSD. Without an SSD, using this data can make LanguageTool much slower.'
  echo '· The install script will modify your configuration files in each home directory.'
  echo ''
}

package() {
  install -d "${pkgdir}"/usr/share/ngrams
  unlink "${srcdir}"/${pkgname}-${pkgver}.zip
  mv "${srcdir}"/* "${pkgdir}"/usr/share/ngrams/
}
