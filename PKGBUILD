# Maintainer: "bountin" Martin Prebio

pkgname=marmota
pkgver=22.17.0
pkgrel=1
pkgdesc="Simple Markdown Presentations"
arch=('x86_64')
url=https://marmota.app/downloads/thank-you/#linux
licence=('unknown')
depends=("gtk3" "libxss" "libxtst" "nss")
source=("https://download.marmota.app/linux/deb/x64/${pkgname}_${pkgver}_amd64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
b2sums=('190afa970dcc419ce6bca12f6cad7c557389aaa9d90f3999a473be316fce4bd73a9eff1eb0fc6e6399f9fecba8241866ddbe168d4692ad79a34130117f79c575')

package() {
  bsdtar -O -xf "${pkgname}_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

  # Permissions fix
  find "${pkgdir}" -type d -exec chmod 755 {} \;

  # Move license
#  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
#  mv "${pkgdir}/usr/share/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
#  ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/${pkgname}/LICENSE"
}

