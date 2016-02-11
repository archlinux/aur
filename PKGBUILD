# Maintainer: PromAvtomatika <info@spnx.ru>
# Contributor: George Kiselyov <tinctura[dot]ginseng[at]gmail[dot]com>

pkgname=spnxclient
pkgver=1.0.56.1
pkgrel=0
pkgdesc="ACS Sphinx client module"
arch=('any')
url="http://www.spnx.ru"
license=('custom')
#depends=('libc6>=2.8','libudev-dev>=164-3','gksu>=2.0.2-5','libpcsclite-dev')
source=("http://spnx.ru/dl/spnxclient_${pkgver}-${pkgrel}_all.deb"
        "spnx-client.desktop")
sha256sums=('806ede85af6200409044eccfee03e5bec99d124fd81ba96c0b6aeea665a44812'
            '6ba598b7bac9667cf3520222f1b2201f2fb7f37b96ee9c6de7222bd6bf360552')

prepare() {
  cd "${srcdir}"
  bsdtar -xf data.tar.gz
}

package() {
  cd "${srcdir}"
  install -m 755 -d "${pkgdir}"/usr/share/sphinx
  cp -r usr/share/sphinx "${pkgdir}"/usr/share/
  install -Dm755 usr/bin/spnxclient "${pkgdir}/usr/bin/spnxclient"
  install -Dm644 spnx-client.desktop "${pkgdir}/usr/share/applications/spnx-client.desktop"
}
