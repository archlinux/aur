# Maintainer: Jaja83
#

pkgname=languagetool-ngrams-de
pkgver=20150819
pkgrel=1
pkgdesc="Finding errors using n-gram data, german text"
arch=('any')
url="http://wiki.languagetool.org/finding-errors-using-n-gram-data"
license=('LGPL')
optdepends=('languagetool: system wide installation of LT'
'libreoffice-extension-languagetool: standalone LT for LibreOffice'
'openoffice-extension-languagetool: standalone LT for OpenOffice')
makedepends=('unzip')
install=${pkgname}.install
source=(${pkgname}-${pkgver}.zip::"http://languagetool.org/download/ngram-data/ngrams-de-${pkgver}.zip")
noextract=(${pkgname}-${pkgver}.zip)
md5sums=('f9c8bbd525198fdf8005eed763ceda25')

prepare() {
  echo ''
  echo 'Warning:'
  echo '· Footage is about 3.1G in size!'
  echo '· Make sure you have a _fast_ disk serving /usr/share, i.e. an SSD. Without an SSD, using this data can make LanguageTool much slower.'
  echo '· Because of this honorable size, compressing this package literally take hours. Make sure to disable compression entirely – at least make use of xz SMP feature. See makepkg wiki page for details …'
  echo ''
}

package() {
  install -d "${pkgdir}"/usr/share/ngrams
  unzip -q "${srcdir}"/${pkgname}-${pkgver}.zip -d "${pkgdir}"/usr/share/ngrams
}
