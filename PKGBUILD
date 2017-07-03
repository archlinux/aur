# Maintainer: PromAvtomatika <info@sigursys.com>
# Contributor: George Kiselyov <i[dot]am[at]kiselyov-george[dot]ru>

pkgname=spnxclient
pkgver=1.0.57.35
pkgrel=0
pkgdesc="ACS Sphinx client module"
arch=('any')
url="http://sigursys.com/download_current.php"
license=('custom')
source=("http://sigursys.com/dl/spnxclient_${pkgver}-${pkgrel}_all.deb"
        "spnx-client.desktop")
sha256sums=('8e41c411bd32fe05c5bc583e17d27b9f589f4cce69bd884605a8551efefbbf4d'
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
