# Maintainer: Fabien JUIF <fabien.juif@gmail.com>
pkgname=superpowers
pkgver=0.19.0
pkgrel=2
pkgdesc="2D+3D game making for indies."
arch=('x86_64')
url="http://superpowers-html5.com/"
license=('ISC')
depends=('nodejs' 'gtk2' 'libxtst' 'python' 'alsa-lib' 'libnotify' 'gcc-libs-multilib' 'gconf' 'nss')
source=("https://github.com/superpowers/superpowers/releases/download/v0.19.0/superpowers-0.19.0-linux-x64.zip")
md5sums=('e8f0fad73f729ee291cdcca2284aeb22')

package() {
  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/bin"

  cp -R "${srcdir}/${pkgname}-${pkgver}-linux-x64" "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/Superpowers" "${pkgdir}/usr/bin/${pkgname}"

  # Fix permissions
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 '{}' +
  find "${pkgdir}/opt/${pkgname}" -type f -exec chmod 644 '{}' +
  chmod +x "${pkgdir}/opt/${pkgname}/Superpowers"
}
