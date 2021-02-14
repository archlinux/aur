# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=eparakstitajs3
pkgver=1.5.13
pkgrel=3
pkgdesc="Application software to sign and validate documents in EDOC and PDF formats."
arch=('x86_64')
url="https://www.eparaksts.lv"
license=('custom:E-PARAKSTĪTĀJS 3')
groups=('eparaksts')
depends=('gtk2' 'gtk3' 'java-environment' 'libnet')
optdepends=('python-nautilus: Nautilus context menu integration'
            'eparaksts-token-signing: eParaksts browser plugins'
            'latvia-eid-middleware: libraries for Latvia eID cards')
source=("https://www.eparaksts.lv/files/ep3updates/debian/pool/eparaksts/e/${pkgname}/${pkgname}_${pkgver}_amd64.deb"
        'dpkg'
        'eparakstitajs3.patch')
sha512sums=('9e2ea6e038bbc7c56e9ce3c7cbae4c4bb2470e5416c39d5ad337cac4bba3e81860cce4a5702a2fd2b1e93937321ac5da24d0966b21fabc8d043ff917e273992c'
            '2831607d41e6480620869264866711341917de093bdd0228c2b8efb041c9c9ae8861ca0564f1e9917dab888cad69eb81c97a7a5509b58adb2ce61eb7a95a3d4a'
            '4b361882fd9701544afb7c68bb6aa3807cb9ecbe6026e76727e9c37ebe4dff69946f92bd55addb8bf8b0b7c30d846d2aeaad11b84391881378c7a20680fdc8ba')

package() {

  tar -xJf data.tar.xz -C "${pkgdir}"

  install -D "${pkgdir}/usr/share/doc/eparakstitajs3/copyright" "${pkgdir}/usr/share/licenses/$pkgname/copyright"

  install -D "${srcdir}/dpkg" "${pkgdir}/opt/eparakstitajs3/dpkg"

  cd "${pkgdir}"
  patch --forward --strip=2 < "${srcdir}/${pkgname}.patch"
  
}

