# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=rebel
pkgver=0.9.1
pkgrel=1
pkgdesc="Fast, beautiful and focused note taking"
arch=('x86_64')
url="https://github.com/kumarasinghe/rebel"
license=('MIT')
depends=('nss'
         'gtk3')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.deb::https://github.com/kumarasinghe/rebel/releases/download/${pkgver}/rebel-${pkgver}-ubuntu-amd64.deb"
        'LICENSE::https://github.com/kumarasinghe/rebel/raw/master/LICENSE')
sha512sums=('e9ea488684665b40b130ef86d64f4190b1a0f0736d232416b36cfd13eba4ddf0b46d0581ef87baffe5e2497f75a8a7ad51b7df8faf48019777fd86820c62185d'
            'd094f158926e0ef3a7577ed8c0184a29a186201ce40457e4a4f42aeb8875eb5978a3feb882f25f228cbd78ea0aafbf81b6c19455422c91c6a0341476756585be')

package(){
  # Extract package data
  tar xJf data.tar.xz -C "${pkgdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  chown -R root:root "${pkgdir}/"
  chmod 755 "${pkgdir}/usr/"
  chmod 755 "${pkgdir}/opt/"
  chmod 755 "${pkgdir}/usr/share/"
  chmod 755 "${pkgdir}/usr/share/applications"
}
