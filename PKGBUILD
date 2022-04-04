# Maintainer: johnnybash <jb at wachenzell dot org> PGP D126E2910543DE2D
# Contributor: Tom Wizetek <tom@wizetek.com>

pkgname=ldapadmin
pkgver=1.8.3
pkgrel=3
pkgdesc="Client and administration tool for LDAP directory management"
url='https://github.com/ibv/LDAP-Admin'
arch=('any')
license=('GPL')
depends=('gtk2')
source=("https://github.com/ibv/LDAP-Admin/releases/download/v${pkgver}/LdapAdmin-x86_64.tar.xz")
sha256sums=('270dff20cd0aefdb0f9c9eeaa16f80b8e684fd0a6aab150cc10547866b73a405')
b2sums=('82b0b2ac399878dc7ea6d8f994a01a1694bbd0e42ff7b313fb2f5f6bdde070e261d708750539868965feba60691c8d7b21975bcde3ee118fd7284a073b9a154f')

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
