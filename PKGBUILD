# Maintainer: David Santiago <demanuel@ymail.com>
pkgname=comma-ide-community
_pkgname=comma-ide
_tarname=comma-community
pkgrel=1
pkgver=2019.10.0
provides=(${_pkgname})
pkgdesc="The Integrated Development Environment for Perl 6."
arch=('any')
url="https://commaide.com/"
license=('APACHE')
depends=('java-runtime')
optdepends=('rakudo-star' 'rakudo')
source=("https://commaide.com/download/community/linux")
sha512sums=('364a91c67bb140b4a48a00f3cf6d553a5dd9b8afef0c2e254497b777a6ddb7b99b1c549e13957648b9847e1739e34b02413066b0d2e3ea4c87fb4e68c6b973b8')
install=comma-ide.install

package() {
set -xv
  mkdir -p $pkgdir/opt/ $pkgdir/usr/bin/ $pkgdir/usr/share/applications/ ${pkgdir}/usr/share/icons/
  cp -R $srcdir/${_tarname}-${pkgver:0:7} $pkgdir/opt/

  cat <<EOF > $pkgdir/usr/share/applications/${_pkgname}.desktop
[Desktop Entry]
Version=1.0
Type=Application
Exec=/usr/bin/comma %f
Icon=${_pkgname}
Terminal=false
Type=Application
Name=Comma Community Edition
Comment=The Drive to Develop
Categories=Development;IDE;
StartupWMClass=jetbrains-comma-ce
EOF

  ln -s /opt/${_tarname}-${pkgver:0:7}/bin/comma.png ${pkgdir}/usr/share/icons/${_pkgname}.png
  ln -s /opt/${_tarname}-${pkgver:0:7}/bin/comma.sh $pkgdir/usr/bin/comma
  set +xv
}


