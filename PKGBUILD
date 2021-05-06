# Maintainer: David Santiago <demanuel@ymail.com>
pkgname=comma-ide-community
_pkgname=comma-ide
_tarname=comma-community-2021.04.0
pkgrel=2
pkgver=202.6948.81
provides=(${_pkgname})
pkgdesc="The Integrated Development Environment for Raku (formerly Perl 6)."
arch=('any')
url="https://commaide.com/"
license=('APACHE')
depends=('java-runtime')
optdepends=('rakudo-star' 'rakudo')
source=("https://commaide.com/download/community/linux")
sha512sums=('103f7489d09a50397b9314869d55b4a6ccfb7a475b91a690357b4fed78dc0055b1dbe707ac1de344e272d6bb47961d359bf6943be942303eefc286583364105a')
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


