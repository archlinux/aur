# Author: Christoph Jaeger <christophjaeger@linux.com>
# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
# Contributor: Marc Rozanc <marc@rozanc.fr>

pkgname="tuxedo-wmi-dkms"
pkgver="1.5.1"
pkgrel=3
pkgdesc='A reverse engineering driver for the Clevo P150EM/P170EM/P150SM/P157SM/P170SM/P177SM backlight keyboard, by Christoph Jaeger (DKMS version)'
arch=('x86_64')
license=('GPL')
url="https://tuxedocomputers.com"
depends=('dkms')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel'
            'linux-zen-headers: build modules against ZEN kernel')
provides=("tuxedo-wmi")
replaces=("clevo-wmi-dkms")
conflicts=("clevo_wmi-git" "clevo-wmi" "clevo-wmi" "clevo-wmi-dkms" "tuxedo-wmi")
source=(http://deb.tuxedocomputers.com/ubuntu/pool/main/t/tuxedo-wmi-dkms/tuxedo-wmi-dkms_1.5.1_all.deb)
sha256sums=('e5446c4c327752ddc74f59bc9e8239d912aee6ef10b121d0690c2b5f68262057')

package() {

  ar vx "${srcdir}/tuxedo-wmi-dkms_1.5.1_all.deb"
  tar -xf "${srcdir}/data.tar.xz"
  mkdir -p "${pkgdir}/usr/src/tuxedo-wmi-${pkgver}"
  cp -r "${srcdir}/usr/src/tuxedo-wmi-${pkgver}"/* "${pkgdir}/usr/src/tuxedo-wmi-${pkgver}"
  install -D "${srcdir}/usr/src/tuxedo-wmi-${pkgver}/dkms.conf" "${pkgdir}/usr/src/tuxedo-wmi-${pkgver}/dkms.conf"

}

