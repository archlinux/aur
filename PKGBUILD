# Maintainer: johnnybash <jb at wachenzell dot org> PGP D126E2910543DE2D
# Contributor: Tom Wizetek <tom@wizetek.com>

pkgname=ldapadmin
pkgver=1.8.3
pkgrel=2
pkgdesc="Client and administration tool for LDAP directory management"
url='https://github.com/ibv/LDAP-Admin'
arch=('any')
license=('GPL')
depends=('gtk2')
source=("https://github.com/ibv/LDAP-Admin/releases/download/v${pkgver}/LdapAdmin-x86_64.tar.xz")
sha256sums=('b17a1174fc369a6897147ea3f386bc7f9b4c4608d01a3894b3ee946a5de96c1b')

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
