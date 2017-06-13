# Maintainer: PromAvtomatika <info@spnx.ru>
# Contributor: George Kiselyov <tinctura[dot]ginseng[at]gmail[dot]com>

pkgname=spnxclient
pkgver=1.0.57.20
pkgrel=0
pkgdesc="ACS Sphinx client module"
arch=('any')
url="http://sigursys.com"
license=('custom')
#depends=('libc6>=2.8','libudev-dev>=164-3','gksu>=2.0.2-5','libpcsclite-dev')
source=("http://sigursys.com/dl/spnxclient_${pkgver}-${pkgrel}_all.deb"
        "spnx-client.desktop")
sha256sums=('5c9970d74053be90c1c8285f6ab1c10fffb167aedec87b6338429812e78ef389'
            '6ba598b7bac9667cf3520222f1b2201f2fb7f37b96ee9c6de7222bd6bf360552')

prepare() {
  cd "${srcdir}"
  bsdtar -xf data.tar.xz
}

package() {
  cd "${srcdir}"
  install -m 755 -d "${pkgdir}"/usr/share/sphinx
  cp -r usr/share/sphinx "${pkgdir}"/usr/share/
  install -Dm755 usr/bin/spnxclient "${pkgdir}/usr/bin/spnxclient"
  install -Dm644 spnx-client.desktop "${pkgdir}/usr/share/applications/spnx-client.desktop"
}
