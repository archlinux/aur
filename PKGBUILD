# Maintainer: David Santiago <demanuel@ymail.com>
pkgname=comma-ide-community
_pkgname=comma-ide
_tarname=comma-community
pkgrel=1
pkgver=2020.04.0
provides=(${_pkgname})
pkgdesc="The Integrated Development Environment for Raku (formerly Perl 6)."
arch=('any')
url="https://commaide.com/"
license=('APACHE')
depends=('java-runtime')
optdepends=('rakudo-star' 'rakudo')
source=("https://commaide.com/download/community/linux")
sha512sums=('403db3bfbc52172c038796911f2b153b361f3657eea23e64ce18d9b5d6d5edd5c8be458fd01abf75733e4ac7b8ff64225ca569dce6455dabba9d22dcbdc41290')
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


