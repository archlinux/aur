# Maintainer: Johannes Schleifenbaum <johannes [at] js-webcoding [dot] de>
# Please report issues at https://github.com/jojosch/pkgbuilds

pkgname=nodejs-pageres
pkgver=1.2.0
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
  'd62b6d0a006befd2b78dd1efc8a84a49005859c6'
  '855b17174b0193c9fbcaf000327b2bcb3d4c38fd'
)
sha256sums=(
  '5db5d486381f2b57799222ee91b98c91e55537467064a1d85035adefd6e02c14'
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
