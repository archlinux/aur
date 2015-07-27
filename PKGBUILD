# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Dmitry Nosachev <quartz64@gmail.com>
# Contributor: Patrick Schneider <Patrick.Schneider@uni-ulm.de>

set -u
pkgname='openmeetings'
pkgver='1.9.1'
pkgrel='1'
pkgdesc='Multi-Language Cross-Platform Customizable Web-Conferencing and Collaboration'
arch=('any')
url='http://code.google.com/p/openmeetings/'
#url=('http://openmeetings.apache.org/')
license=('apache')
depends=('mysql' 'imagemagick' 'ghostscript' 'swftools' 'sox' 'lame' 'openjdk6'
 'ffmpeg' 'libreoffice-base' 'libreoffice-calc' 'libreoffice-common'
  'libreoffice-draw' 'libreoffice-impress' 'libreoffice-writer')
makedepends=('unzip')
backup=("opt/red5/${pkgname}/webapps/openmeetings/WEB-INF/classes/META-INF/persistence.xml")
install="${pkgname}.install"
source=('http://openmeetings.googlecode.com/files/openmeetings_1_9_1_r4707.zip')
noextract=('openmeetings_1_9_1_r4707.zip')
sha256sums=('0431c3d72a4aa0ac32f7ed25d989c0a583286c7f290936ac8763e17f1748056a')

build() {
  :
}

package() {
  set -u
  install -dm755 "${pkgdir}/opt"
  #cd "${pkgdir}/opt"
  unzip -q -d "${pkgdir}/opt" "${srcdir}/openmeetings_1_9_1_r4707.zip"
  chmod 755 "${pkgdir}/opt/red5/red5.sh"

  # Ensure there are no forbidden paths (git-aurcheck)
  ! grep -alqr "/sbin" "${pkgdir}" || echo "${}"
  ! grep -alqr "/usr/tmp" "${pkgdir}" || echo "${}"
  ! test -d "${pkgdir}/usr/sbin" || echo "${}"
  set +u
}
set +u
