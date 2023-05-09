# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=yt-cli
pkgver=0.1.1
pkgrel=1
pkgdesc="An easy to use CLI YouTube client"
arch=('any')
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(mpv npm)
install="yt-cli.install"
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz.sig"
  )
sha512sums=(
  'c00ffd472ab904e8bf81fca5406d7f00befe664122b7c439940ee8d348604b7105ed3901b786d0252cb0ee65e31d9017afb12f0f3032daebf9e29c161b10c992'
  'd8c68e0dc67146d0dc85fcd9c7f3d55e808f0375be01e4d7ea7edc6abecc63e400850aa8e44a2c69d5b85126516f9b2e2657d900f0ac06db1d3a1875cdc0780a'
  )
md5sums=(
  'b90889a64654c5a08f2585742e8a783b'
  'd011df2e1d2fa85c692466e1896e6229'
  )

validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
  '689FE57F19CB77B8B6B9A8B12A049C6835A22075'
  )

validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
  '689FE57F19CB77B8B6B9A8B12A049C6835A22075'
  )

validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
  '689FE57F19CB77B8B6B9A8B12A049C6835A22075'
  )

validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
  '689FE57F19CB77B8B6B9A8B12A049C6835A22075'
  )

package() {

  [ -d "${srcdir}/${pkgname}/usr/lib/node_modules/${pkgname}" ] &&
    cd "${srcdir}/${pkgname}/usr/lib/node_modules/${pkgname}" ||
    cd "${srcdir}/usr/lib/node_modules/${pkgname}"

  which yarn >/dev/null 2>&1 && yarn install || npm install

  [ -d "${srcdir}/${pkgname}" ] && cd "${srcdir}/${pkgname}" || cd "${srcdir}"

  install -dm0755 "${pkgdir}"/usr/lib/node_modules/${pkgname}
  install -Dm0755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -ar usr/lib/node_modules/${pkgname}/* "${pkgdir}"/usr/lib/node_modules/${pkgname}

}
