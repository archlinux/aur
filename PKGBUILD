# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: xav <xav at ethertricks dot net>
# Contributor: Nathan O <ndowens.aur at gmail dot com>

pkgname='hyenae'
pkgver='0.36'
pkgrel='2'
pkgdesc='A highly flexible platform independent network packet generator. It allows you to reproduce several MITM, DoS and DDoS attack scenarios'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/hyenae/'
license=('GPL3')
depends=('libpcap' 'libdnet')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgver}-1/${pkgname}-${pkgver}-1.tar.gz")
sha256sums=('8f752061c0ba8ce3e771bf03b1d9c18849d7e1d91751323971e42695ac277db8')

prepare(){
  cd "${srcdir}/${pkgname}-${pkgver}-1"
  ./configure --prefix='/usr' --mandir='/usr/share/man'
}

build(){
  cd "${srcdir}/${pkgname}-${pkgver}-1"
  make -s #-j $(nproc) # not big enough for multi processors
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}-1"
  make DESTDIR="${pkgdir}" install
}
