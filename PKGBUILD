# Maintainer: Spencer Muise <smuise@protonmail.com>
pkgname=doppler-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A zero configuration remote monitoring tool designed to be better than nothing"
arch=('any')
url="https://github.com/EnKrypt/Doppler"
license=('GPL3')
provides=('doppler')
options=(!strip) # stripping this binary breaks it
source=(
  "https://github.com/EnKrypt/Doppler/releases/download/v${pkgver}/doppler-${pkgver}-linux-x64"
  "doppler.sysusers"
  "doppler.service"
)
md5sums=('571e0cfe6aea949544e231af8cfdda14'
         '76c5b7b4441aa65df739eea82487f830'
         '8bf035f980c6424235f1dfa123fa9930')

package() {
  install -D -m 655 "${srcdir}/doppler-${pkgver}-linux-x64" "${pkgdir}/usr/bin/doppler"
  install -Dm 644 "${srcdir}/doppler.sysusers" "${pkgdir}/usr/lib/sysusers.d/doppler.conf"
  install -Dm 644 "${srcdir}/doppler.service" "${pkgdir}/usr/lib/systemd/system/doppler.service"
}

