pkgname=pele
pkgver=1.13.0
pkgrel=1
pkgdesc="Fast, lightweight Mermaid renderer that outputs themeable SVG"
arch=('any')
url="https://github.com/obsidianmd/pele"
license=('MIT')
depends=('nodejs>=20')
conflicts=('pele-git')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('00f879d86c5a6ece897ef70e18fd228a9952bba338a0cb1293b373900d7414bd')

package() {
  local module_dir="${pkgdir}/usr/lib/node_modules/${pkgname}"

  install -d "${module_dir}"
  bsdtar -xf "${pkgname}-${pkgver}.tgz" -C "${module_dir}" \
    --strip-components 1 --no-same-owner
  install -Dm644 "${module_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
