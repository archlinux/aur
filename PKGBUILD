# Maintainer: Jaja <jaja@mailbox.org>
#

pkgname=languagetool-word2vec-en
pkgver=20180211
pkgrel=1
pkgdesc="Finding errors using neural network rules, english text"
arch=('any')
url="https://forum.languagetool.org/t/neural-network-rules/2225"
license=('CCPL')
optdepends=('languagetool: system wide installation of LT'
'libreoffice-extension-languagetool: standalone LT for LibreOffice'
'openoffice-extension-languagetool: standalone LT for OpenOffice')
install=${pkgname}.install
source=(${pkgname}-${pkgver}.zip::"https://languagetool.org/download/word2vec/en.zip")
md5sums=('be17427960f0999f4068e0ec257a4fda')
#PKGEXT='.pkg.tar'
options=(!strip)

prepare() {
  echo ''
  echo 'Warning:'
  echo 'The install script will modify your configuration files in each home directory.'
  echo ''
}

package() {
  install -d "${pkgdir}"/usr/share/word2vec
  unlink "${srcdir}"/${pkgname}-${pkgver}.zip
  mv "${srcdir}"/* "${pkgdir}"/usr/share/word2vec/
}
