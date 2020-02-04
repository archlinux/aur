# Maintainer: David Santiago <demanuel@ymail.com>
pkgname=comma-ide-community
_pkgname=comma-ide
_tarname=comma-community
pkgrel=1
pkgver=2020.01.0
provides=(${_pkgname})
pkgdesc="The Integrated Development Environment for Raku (formerly Perl 6)."
arch=('any')
url="https://commaide.com/"
license=('APACHE')
depends=('java-runtime')
optdepends=('rakudo-star' 'rakudo')
source=("https://commaide.com/download/community/linux")
sha512sums=('41bac679894cfa4a573b568765ea3c4acaf0acf495dffe525dd2f1cdb26d7ae2dd210e6346198434b2a2a6aca975e930631d3f37b491d4898ee16ec25c1ec2c8')
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


