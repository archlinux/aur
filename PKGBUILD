# Maintainer: Jaja <jaja@mailbox.org>
#

pkgname=languagetool-word2vec-pt
pkgver=20180211
pkgrel=2
pkgdesc="Finding errors using neural network rules, portuguese text"
arch=('any')
url="https://forum.languagetool.org/t/neural-network-rules/2225"
license=('CCPL')
optdepends=('languagetool: system wide installation of LT'
'libreoffice-extension-languagetool: standalone LT for LibreOffice'
'openoffice-extension-languagetool: standalone LT for OpenOffice')
install=${pkgname}.install
source=(${pkgname}-${pkgver}.zip::"https://languagetool.org/download/word2vec/pt.zip")
md5sums=('3808d92488f0d57f1884d8c5ce8aebad')
PKGEXT='.pkg.tar'
#LANG='C'
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
