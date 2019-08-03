# Maintainer: Saphire ROYET <saphire.royet@protonmail.com>
# Contributor: Fabien JUIF <fabien.juif@gmail.com>
pkgname=superpowers
pkgver=6.0.0
pkgrel=1
pkgdesc="2D+3D game making for indies."
arch=('x86_64')
url="http://superpowers-html5.com/"
license=('ISC')
depends=('nodejs' 'gtk2' 'libxtst' 'python' 'alsa-lib' 'libnotify' 'gcc-libs-multilib' 'gconf' 'nss')
source=("https://github.com/superpowers/superpowers-app/releases/download/v${pkgver}/superpowers-v${pkgver}-linux-x64.zip")
md5sums=('ec18b52f2cce543d8a7ac507e97a26d1')

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
