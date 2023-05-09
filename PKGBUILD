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
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '00c24f046cd1752604bab3176ee88b3c1f4c124354321fa598e1905ce8405f9f62b3e9f71caa1aef70ba691bbe61092311bd57b03a6fe041f3d50c3b43b98e8a'
  '46cbad3a6592c88db3daee0d810b3a20940b9f2057d21c9e1f138acf6e5fff9ab9efa73fe49b78e1e2c811352dd6215be3b6648e50938027aa2354237a6fbf22'
  )
md5sums=(
  '429f2b65a5388788d73c8035b204fb0c'
  '41974e993c498d6935563a210bc9dedb'
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
