# Maintainer: Gerard Salvatella <gerard.salvatella@gmail.com>

pkgname=ultimate-oldschool-pc-font-pack
pkgver=1.0
_relver=1.0
_Px437_dir="Px437 (TrueType - DOS charset)"
_PxPlus_dir="PxPlus (TrueType - extended charset)"
pkgrel=1
pkgdesc="System and BIOS fonts from DOS-era IBM PCs and compatibles"
url="https://int10h.org/oldschool-pc-fonts"
arch=(any)
license=(custom)
_tarname=${pkgname}_v${_relver}
source=("$_tarname.zip::https://int10h.org/oldschool-pc-fonts/download/ultimate_oldschool_pc_font_pack_v1.0.zip")
sha256sums=('7666cf23176e34ea03a218b5c1500f4ad729d97150ab7bdb7cf2adf4c99a9a7a')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname}" "$pkgdir/usr/share/licenses/${pkgname}"
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 "${srcdir}/${_Px437_dir}"/*.ttf "${srcdir}/${_PxPlus_dir}"/*.ttf
  install -Dm644 "${srcdir}/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

