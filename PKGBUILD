# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname=nodejs-pageres
pkgver=1.1.0
pkgrel=1
pkgdesc="Get screenshots of websites in different resolutions"
arch=(any)
url="https://github.com/sindresorhus/pageres"
license=("MIT")
depends=('nodejs')
optdepends=()
source=(
    "http://registry.npmjs.org/${pkgname/nodejs-/}/-/${pkgname/nodejs-/}-${pkgver}.tgz"
    "LICENSE"
)
noextract=("${pkgname/nodejs-/}-${pkgver}.tgz")
sha1sums=(
  '11fa89444d377941971d092d756f40c12337fc79'
  '855b17174b0193c9fbcaf000327b2bcb3d4c38fd'
)
sha256sums=(
  'ffe735a8679180e90f23d204afda686930ae40af7263e8cb2b926a13624ec10c'
  'a09bad52fe9deab4338f4f80105f8b8d0c10a2618a8b4517a2cf260b48d968d2'
)

package() {
  cd "${srcdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"

  npm install --user root -g --prefix "${pkgdir}/usr" "${pkgname/nodejs-/}@${pkgver}"
}
