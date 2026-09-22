# Maintainer: Kyle Thompson <kylejeromethompson@gmail.com>
#
# --- DISCLAIMER ---
# This PKGBUILD is an unofficial community contribution. It is not affiliated with,
# endorsed, or supported by CrowdStrike, Inc.
#
# This package does not distribute the Falcon sensor. Download the pinned
# Debian/Ubuntu amd64 package from the Falcon console into ~/Downloads.
# The pinned filename and sha256 are recorded below. A Downloads file that
# does not match is skipped.
# Sensor update policies in the Falcon console deliver later versions.
# You are responsible for having a license to use the software.
#
# This installer is provided "AS IS" without warranty of any kind, express or
# implied. The user assumes all risk and responsibility for its use.
#
# Terms of Use: https://www.crowdstrike.com/software-terms-of-use/
# Privacy Notice: https://www.crowdstrike.com/privacy-notice/

pkgname=falcon-sensor
pkgdesc='CrowdStrike Falcon sensor installer for Linux'
arch=('x86_64')
url='https://falcon.crowdstrike.com/'
license=('custom')
# Libraries the sensor loads after the local Debian package is unpacked.
depends=('glibc' 'zlib' 'openssl' 'libnl')
# Pinned sensor build. Bump these together when you publish a tested release.
_pkgver=8.10.0
_pkgrel=19403
pkgver=${_pkgver}
pkgrel=${_pkgrel}
_deb_sha256=f35e31f05a475c766b19e762dc78846ac2900633cd931030e041eb931194b160
source=('LICENSE')
sha256sums=('323c9971c5f7e3b360783601922c063801e0bbd425351faaafaf476b5b29fecb')

package() {
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 "${pkgdir}/usr/share/falcon-sensor"
  printf 'version=%s-%s\nfilename=falcon-sensor_%s-%s_amd64.deb\nsha256=%s\n' \
    "${_pkgver}" "${_pkgrel}" "${_pkgver}" "${_pkgrel}" "${_deb_sha256}" \
    > "${pkgdir}/usr/share/falcon-sensor/pin"
}
