# Maintainer: David Santiago <demanuel@ymail.com>
pkgname=comma-ide-community
_pkgname=comma-ide
_tarname=comma-community
pkgrel=1
pkgver=2019.7.0
provides=(${_pkgname})
pkgdesc="The Integrated Development Environment for Perl 6."
arch=('any')
url="https://commaide.com/"
license=('APACHE')
depends=('java-runtime')
optdepends=('rakudo-star' 'rakudo')
source=("https://commaide.com/download/community/linux")
sha512sums=('4dff91adeb57a5a249bcbe3d600026535063527e0daf29a907f5bdce19d7d3ee98cb24c6dad59a87a029c84ba72f17ebc096ed83f890f91b16fc730b88421a9f')
install=comma-ide.install

package() {
set -xv
  mkdir -p $pkgdir/opt/ $pkgdir/usr/bin/ $pkgdir/usr/share/applications/ ${pkgdir}/usr/share/icons/
  cp -R $srcdir/${_tarname}-${pkgver:0:6} $pkgdir/opt/

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

  ln -s /opt/${_tarname}-${pkgver:0:6}/bin/comma.png ${pkgdir}/usr/share/icons/${_pkgname}.png
  ln -s /opt/${_tarname}-${pkgver:0:6}/bin/comma.sh $pkgdir/usr/bin/comma
  set +xv
}


