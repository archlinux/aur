# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Tomasz Zok <tomasz.zok [at] gmail.com>

set -u
pkgname='undbx'
pkgver='0.21'
pkgrel='1'
pkgdesc='Tool to extract, recover and undelete e-mail messages from Outlook Express .dbx files'
arch=('i686' 'x86_64')
#url='http://code.google.com/p/undbx/'
url='https://sourceforge.net/projects/undbx/'
license=('GPLv3')
#source=("http://undbx.googlecode.com/files/undbx-${pkgver}.tar.gz")
source=("http://iweb.dl.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d29b0b9890eed965f8b84ce139579a87b960dc8de22a7fbba236d90c7f0b9a59')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix='/usr'
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s # -j "$(nproc)" # Too small for threaded make
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
