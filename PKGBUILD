# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: GordonGR <ntheo1979@gmail.com>

pkgname=otf-gfs-neohellenic-math
pkgver=20220713
pkgrel=1
pkgdesc='An open type mathematical font from the Greek Font Society.'
arch=(any)
url="https://www.greekfontsociety-gfs.gr"
license=('custom: SIL-OFL')
depends=()
makedepends=('unzip')
source=("${url}/_assets/fonts/GFS_NeoHellenic_Math.zip"
  "LICENSE")
noextract=(${source[@]##*/})
sha512sums=('75168c5a0da5a123aa6c6dc8283b13d04ddace96ec594b057534a37f942aa334d08b8957cc8d879a77332c486556df04eb7f9f944bf0b338c8990a27de93096a'
  '9583e535c20621e989455cc76e97d7c71b7c592dc02036309e228ccdee1b0d56067bbf367ab414fcf20a428d05e7a9149851b46b5f6d6637b86f29c3ecf7629e')

package() {
  _xlist="README *.sty *.pdf"
  unzip GFS_NeoHellenic_Math.zip -x ${_xlist}

  install -d ${pkgdir}/usr/share/fonts/${pkgname}
  install -Dm 644 GFS*/*otf ${pkgdir}/usr/share/fonts/${pkgname}
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
