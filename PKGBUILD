# Maintainer: johnnybash <jb at wachenzell dot org> PGP D126E2910543DE2D
# Contributor: Tom Wizetek <tom@wizetek.com>

pkgname=ldapadmin
pkgver=1.8.3
pkgrel=4
pkgdesc="Client and administration tool for LDAP directory management"
url='https://github.com/ibv/LDAP-Admin'
arch=('any')
license=('GPL')
depends=('gtk2')
source=("https://github.com/ibv/LDAP-Admin/releases/download/v${pkgver}/LdapAdmin-x86_64.tar.xz")
sha256sums=('805eea323326c128be782cbcc024dc5f2b2af592b51f11e339e1d418661b8b10')
b2sums=('9beb59ff7ad904f862b0a6a563b5da4aff2225fe274e3c0b4f5428cdd3833427d0be5a60e21b806cc4a0bb18111c328c38d40d16392b8050a95bfc252d12cae3')

cat > ${pkgname}.desktop << EOF
[Desktop Entry]
Name=LDAP Admin
Comment=${pkgdesc}
Version=${pkgver}
Exec=/usr/bin/LdapAdmin
Terminal=false
Type=Application
Categories=Network;
EOF

package() {
  install -Dm 755 "${srcdir}/LdapAdmin" "${pkgdir}/usr/bin/LdapAdmin"
  install -Dm 644 "${startdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
