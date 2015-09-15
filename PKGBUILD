# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

# TODO: needs a better icon

set -u
pkgname='jumpman'
pkgver='1.0.2'
pkgrel='2'
pkgdesc='An addictve retro-style game'
arch=('i686' 'x86_64')
url='http://runhello.com/'
license=('custom')
depends_i686=('freetype2' 'glu' 'libgl' 'mesa' 'pcre' 'sdl' 'libpulse')
depends_x86_64=("${depends_i686[@]/#/lib32-}" 'lib32-alsa-plugins')
source=('http://cat.runhello.com/Jumpman_lin.tar.gz' "${pkgname}.sh" "${pkgname}.desktop")
sha256sums=('f803df52902999b76b551b338ff61f7048787cdbada863ff4a8bf80ce212348c'
            '00453d83415cbebe45bd600b6be28bbe065a76721e179adb93c4824ba9689c6a'
            '934636c213556ab597d546a502b5a9c3c39998ed188b9c4efd583cf72af4217a')

package() {
  set -u
  install -Dpm644 'Jumpman/Readme.txt' "${pkgdir}/usr/share/licenses/${pkgname}/Readme"
  install -d "${pkgdir}/opt"
  mv Jumpman "${pkgdir}/opt/${pkgname}"

  install -Dpm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dpm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
