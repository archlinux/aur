# Maintainer: Jaja <jaja@mailbox.org>
#

pkgname=languagetool-ngrams-nl
pkgver=20181229
pkgrel=1
pkgdesc="Finding errors using n-gram data, dutch text"
arch=('any')
url="http://wiki.languagetool.org/finding-errors-using-n-gram-data"
license=('CCPL')
optdepends=('languagetool: system wide installation of LT'
'libreoffice-extension-languagetool: standalone LT for LibreOffice'
'openoffice-extension-languagetool: standalone LT for OpenOffice')
makedepends=('unzip')
install=${pkgname}.install
source=(${pkgname}-${pkgver}.zip::"https://languagetool.org/download/ngram-data/ngrams-nl-${pkgver}.zip")
noextract=(${pkgname}-${pkgver}.zip)
md5sums=('e94012c08b4c960f36e090dc29646ef7')
PKGEXT='.pkg.tar'
options=(!strip)

prepare() {
  echo ''
  echo 'Warning:'
  echo '· This package requires about 2.4G to be available within /usr/share.'
  echo '· Make sure you have a _fast_ disk serving /usr/share, i.e. an SSD. Without an SSD, using this data can make LanguageTool much slower.'
  echo '· Because of size, you may run out of RAM if you use tmpfs aware aur helpers.'
  echo ''
}

package() {
  install -d "${pkgdir}"/usr/share/ngrams
  unzip -q "${srcdir}"/${pkgname}-${pkgver}.zip -d "${pkgdir}"/usr/share/ngrams
}
