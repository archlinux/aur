# Maintainer: Saphire ROYET <saphire.royet@protonmail.com>
# Contributor: Fabien JUIF <fabien.juif@gmail.com>
pkgname=superpowers
pkgver=5.3.0
pkgrel=1
pkgdesc="2D+3D game making for indies."
arch=('x86_64')
url="http://superpowers-html5.com/"
license=('ISC')
depends=('nodejs' 'gtk2' 'libxtst' 'python' 'alsa-lib' 'libnotify' 'gcc-libs-multilib' 'gconf' 'nss')
source=("https://github.com/superpowers/superpowers-app/releases/download/v${pkgver}/superpowers-v${pkgver}-linux-x64.zip")
md5sums=('f17dcc608494b0d18e128efc5d80e7c4')

package() {
  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/bin"

  cp -R "${srcdir}/${pkgname}-v${pkgver}-linux-x64" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/Superpowers" "${pkgdir}/usr/bin/${pkgname}"

  # Fix permissions
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 '{}' +
  find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 '{}' +
  chmod +x "${pkgdir}/opt/${pkgname}/Superpowers"
}
