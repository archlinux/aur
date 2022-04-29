# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=latvia-eid-middleware
pkgver=2.0.10
pkgrel=2
pkgdesc="Middleware for using Latvia-eid smart cards"
arch=('x86_64')
url="https://www.eparaksts.lv"
license=('LGPL')
groups=('eparaksts')
depends=('gtk2' 'openssl-1.0' 'libsm' 'pcsclite' 'glu')
optdepends=('nss: modutil tool for installing PKCS#11 module')
install='middleware.install'
source=("https://www.eparaksts.lv/files/ep3updates/debian/pool/eparaksts/l/${pkgname}/${pkgname}_${pkgver}-1_amd64.deb"
        "pintool.patch")
sha512sums=('6a93c0f564dab7fc03e4eae8c31c63f08385dcffcc0c9d852fc6a847595252e60262f14c675456ab2d59596c4f6a1ca5305566342ca93cf6feb408a786e2cc6e'
            'ff5513539072adf213105b473e7509c23ace523aa9d7cd536244ec76dd2afa28bc9494e321c35311d465c73cc1c1ca76eaa7d46c774f24d413b35abe2f54d3d8')

package() {

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"

  cd "${pkgdir}"
  patch --forward --strip=1 < "${srcdir}/pintool.patch"

}
