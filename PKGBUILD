# Maintainer: Jaja83 <arch_me@keemail.me>
#

pkgname=languagetool-ngrams-it
pkgver=20150915
pkgrel=1
pkgdesc="Finding errors using n-gram data, italian text"
arch=('any')
url="http://wiki.languagetool.org/finding-errors-using-n-gram-data"
license=('LGPL')
optdepends=('languagetool: system wide installation of LT'
'libreoffice-extension-languagetool: standalone LT for LibreOffice'
'openoffice-extension-languagetool: standalone LT for OpenOffice')
makedepends=('unzip')
install=${pkgname}.install
source=(${pkgname}-${pkgver}.zip::"http://languagetool.org/download/ngram-data/untested/ngram-it-${pkgver}.zip")
noextract=(${pkgname}-${pkgver}.zip)
md5sums=('SKIP')

prepare() {
  echo ''
  echo 'Warning:'
  echo '· Footage is about 3G in size!'
  echo '· Make sure you have a _fast_ disk serving /usr/share, i.e. an SSD. Without an SSD, using this data can make LanguageTool much slower.'
  echo '· Because of this honorable size, compressing this package literally take hours. Make sure to disable compression entirely – at least make use of xz SMP feature. See makepkg wiki page for details …'
  echo '· Also because of size, you may run out of memory if you use tmpfs aware aur helpers. You are better of not using tmpfs for this one and manually install this Package with "makepkg -s; sudo pacman -U languagetool-ngrams-*" on a spinning-disk based dir.'
  echo ''
}

package() {
  install -d "${pkgdir}"/usr/share/ngrams
  unzip -q "${srcdir}"/${pkgname}-${pkgver}.zip -d "${pkgdir}"/usr/share/ngrams
}
