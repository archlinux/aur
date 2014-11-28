# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Cody Lee <platinummonkey at archlinux dot us>

pkgname=janet
pkgver=0.2.4
pkgrel=1
pkgdesc="A Digital life assistant (DLA) that provides a framework allowing various components to communicate, inspired by Iron Man's JARVIS"
arch=('i686' 'x86_64')
url="http://sites.google.com/site/projectjanet"
license=('CCPL:by-nc' 'GPL')
depends=('monodevelop' 'festival' 'simon')
optdepends=('htk: For customizing simon')
source=(http://sourceforge.net/projects/project-janet/files/Binaries/Bin.tar.gz)
sha256sums=('f0281fa070afc61d7f2ca2f8eac0cba782b5167b2de93a6267b29242ee40877b')

package() {
  cd "${srcdir}"

  mkdir -p /usr/share/$pkgname/scripts
  cp -R ./* /usr/share/$pkgname/.
  
# create jaNET launcher script
  cat <<EOF >>/usr/bin/$pkgname
#!/bin/sh
/usr/bin/mono /usr/share/$pkgname/jaNET.exe "\$\@"
EOF

  chmod a+x /usr/bin/$pkgname
  echo -e 'Take a look at the http://wiki.archlinux.org/index.php/JaNET, to see voice festival and simon settings'
}
