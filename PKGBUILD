# Maintainer: Jaja <jaja@mailbox.org>
#

pkgname=languagetool-ngrams-fr
pkgver=20150913
pkgrel=2
pkgdesc="Finding errors using n-gram data, french text"
arch=('any')
url="http://wiki.languagetool.org/finding-errors-using-n-gram-data"
license=('CCPL')
optdepends=('languagetool: system wide installation of LT'
'libreoffice-extension-languagetool: standalone LT for LibreOffice'
'openoffice-extension-languagetool: standalone LT for OpenOffice')
install=${pkgname}.install
source=(${pkgname}-${pkgver}.zip::"https://languagetool.org/download/ngram-data/ngrams-fr-${pkgver}.zip")
md5sums=('aea738b236a2d1331d807854f13b168c')
PKGEXT='.pkg.tar'
options=(!strip)

prepare() {
  echo ''
  echo 'Warning:'
  echo '· This package requires about 3.2G to be available within /usr/share.'
  echo '· Make sure you have a _fast_ disk serving /usr/share, i.e. an SSD. Without an SSD, using this data can make LanguageTool much slower.'
  echo '· Because of size, you may run out of RAM if you use tmpfs aware aur helpers.'
  echo '· The install script will modify your configuration files in each home directory.'
  echo ''
}

package() {
  install -d "${pkgdir}"/usr/share/ngrams
  unlink "${srcdir}"/${pkgname}-${pkgver}.zip
  mv "${srcdir}"/* "${pkgdir}"/usr/share/ngrams/
}
