# Maintainer: Manuel Hutter <aur at mhutter dot net>

pkgname='prunner-bin'
pkgver='0.5.6'
_pkg="PRUNner-${pkgver}-linux-64"
pkgrel='1'
epoch=
pkgdesc='Binary release of PRUNner'
arch=('x86_64')
url='https://github.com/Jacudibu/PRUNner'
license=('MIT')
groups=()
depends=('fontconfig')
provides=('prunner')

# This is required for .NET apps built with `-p:PublishSingleFile=true`
options=("!strip")

sha256sums=('6c7b2db96606ed0775d7c3c02802dca25d95bb2c456c41c029fc991649c9bfc4')
source=('prunner')

sha256sums_x86_64=('7c01bd7c114d36de7f117b3ca450bc2d19074bb17d09fb17e7ea8b083c10c5f7')
source_x86_64=("https://github.com/Jacudibu/PRUNner/releases/download/v${pkgver}/${_pkg}.zip")

shopt -s extglob

package() {
  install -d -m755 "${pkgdir}/opt/${pkgname}"
  install -d -m755 "${pkgdir}/usr/bin"
  cp -r "${srcdir}/${_pkg}/"* "${pkgdir}/opt/${pkgname}/"
  cp "${srcdir}/prunner" "${pkgdir}/usr/bin/prunner"
}
