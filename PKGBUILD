# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: liberodark

pkgname=stacer-bin
pkgver=1.1.0
pkgrel=2
pkgdesc="Linux System Optimizer and Monitoring"
arch=('x86_64')
url="https://github.com/oguzhaninan/Stacer"
license=('MIT')
depends=('qt5-charts' 'qt5-svg' 'hicolor-icon-theme')
source_x86_64=("https://github.com/oguzhaninan/Stacer/releases/download/v${pkgver}/stacer_${pkgver}_amd64.deb")
source=($pkgname.desktop)
sha512sums=('c1935570166c402295d92dad30fe7b4e8189a869561d56bd8d5244138de11d4fa16145ad017f9e7b22733fb7de8a6b79708aba595a80bce7bbe0a037da63260f')
sha512sums_x86_64=('19bcb87f3d99ce090ab1fb917f65f7dd74f0b1e4fc19272eae0ad8d5c66d3dbe53cbdb50841bbd9a0e16f03201cd6cc5f0bc1a57eda41fd096ed275cf762d84a')
options=('strip')
conflicts=('stacer')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
  rm $pkgdir/usr/share/applications/stacer.desktop
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}

