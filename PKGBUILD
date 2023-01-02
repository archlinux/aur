# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=pman
pkgver=1.3
pkgrel=1
pkgdesc="A minimal CLI download manager for all major package managers and URLs/Torrents"
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(dialog)
optdepends=(
  "git: To clone git repositories"
  "npm: To download npm packages."
  "snapd: To download and install snap packages."
  "flatpak: To download and install flatpak packages."
  "python-pip: To download python packages."
  "aria2: To download files or torrents from URLs."
  )
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  'f803ef1d3f74469e8d59e5c2386ec67cddd5466bd2855e9e66d641f18b81be4a3a8c3c2d9a9d8095f3a478eeadda45bb4a9b6a8424a550932ef7ddcf1e961313'
  'a3b047773ce84b66ffae13b1db07ccec1462c3ac96dd8385e341479ae6a919c45c54a2f2e0fb7c0de33318469cfbe7fc133dd2d54fa270fac254b5a69e8cc655'
  )
md5sums=(
  'f4457232351917c8b9c3f4c6424ecbb4'
  '33c4ba2906b796fba05ae40d30dac03e'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
    install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}

