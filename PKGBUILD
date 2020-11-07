# Maintainer: David Santiago <demanuel@ymail.com>
pkgname=comma-ide-community
_pkgname=comma-ide
_tarname=comma-community-2020.10
pkgrel=1
pkgver=202.6948.78
provides=(${_pkgname})
pkgdesc="The Integrated Development Environment for Raku (formerly Perl 6)."
arch=('any')
url="https://commaide.com/"
license=('APACHE')
depends=('java-runtime')
optdepends=('rakudo-star' 'rakudo')
source=("https://commaide.com/download/community/linux")
sha512sums=('8de14a1246b0a87b97f37e573368b684de5f3be2f2f10b6ebe9fad5edfa93e58a9f552ced5983439b490b7a462a6f5cce8503eb0da4058634b7cf4b3f830963b')
install=comma-ide.install

package() {
set -xv
  mkdir -p $pkgdir/opt/ $pkgdir/usr/bin/ $pkgdir/usr/share/applications/ ${pkgdir}/usr/share/icons/
  cp -R $srcdir/${_tarname}  $pkgdir/opt/

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

  ln -s /opt/${_tarname}/bin/comma.png ${pkgdir}/usr/share/icons/${_pkgname}.png
  ln -s /opt/${_tarname}/bin/comma.sh $pkgdir/usr/bin/comma
  set +xv
}


