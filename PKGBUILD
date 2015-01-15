# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Cody Lee <platinummonkey at archlinux dot us>

pkgname=janet
pkgver=0.2.4
pkgrel=8
pkgdesc="A Digital life assistant (DLA) that provides a framework allowing various components to communicate, inspired by Iron Man's JARVIS"
arch=('i686' 'x86_64')
url="http://sites.google.com/site/projectjanet"
license=('CCPL:by-nc' 'GPL')
depends=('monodevelop' 'festival' 'simon')
optdepends=('htk: For customizing simon')
install=$pkgname.install
source=(http://sourceforge.net/projects/project-janet/files/Binaries/Bin.tar.gz)
sha256sums=('cc26a49a60edc1f728f44b5010b678d05ad87b2ba074028178233e954f706042')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/usr/{bin,share/$pkgname/scripts}
  cp -R ./* "${pkgdir}"/usr/share/$pkgname/.

#create jaNET launcher script
  cat <<EOF >>"${pkgdir}"/usr/bin/$pkgname
#!/bin/sh
/usr/bin/mono /usr/share/$pkgname/jaNET.exe "\$\@"
EOF

  chmod a+x "${pkgdir}"/usr/bin/$pkgname
}
