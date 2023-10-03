# Maintainer: shurizzle <shura1991@gmail.com>

pkgname=otf-commit-mono
pkgver=1.139
pkgrel=1
pkgdesc="An anonymous and neutral programming typeface focused on creating a better reading experience."
arch=(any)
url='https://commitmono.com/'
license=('custom:SIL Open Font License v1.1')
source=("commit-mono.zip::https://github.com/eigilnikolajsen/commit-mono/releases/download/v${pkgver}/CommitMono-${pkgver}.zip")
sha256sums=('5cf3b126f8a7c02414b6b25e16c9fe700e3d18f88d9ccdc0aadae8b92e17b078')

package() {
  local size weight srcdir fontdir

  srcdir="CommitMono-${pkgver}"
  fontdir="/usr/share/fonts/OTF"
  fontdir="${pkgdir}${fontdir}"

  install -dm 755 "${fontdir}"
  for size in 400 700; do
    for weight in Regular Italic; do
      install -m 644 "${srcdir}/CommitMono-${size}-${weight}.otf" \
        "${fontdir}/CommitMono-${size}-${weight}.otf"
    done
  done
  install -Dm644 "${srcdir}/license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
