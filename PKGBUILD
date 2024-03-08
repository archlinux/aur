# Maintainer: Martin Diehl <aur@martin-diehl.net>
pkgname=dream3d
pkgver=6.5.171
pkgrel=1
pkgdesc='Analysis tool for microstructure data'
arch=('x86_64')
url='http://dream3d.bluequartz.net'
license=('custom: DREAM.3D License')
depends=('libpng15')
source=(http://dream3d.bluequartz.net/binaries/DREAM3D-${pkgver}-Linux-x86_64.tar.gz
        dream3d.desktop)
sha256sums=('10ee14392f344a69779d370777d9ffd845226669ee5a6ea24e4a58460cdd2fce'
            'f53cf8ef2e97aa31fd41bd6723109502d5909aa43f6796ee7e734fe36ac427bc')
package() {

  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  cd $srcdir

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/opt/dream3d"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"

  cp -r  DREAM3D-${pkgver}-Linux-x86_64/*        $pkgdir/opt/dream3d/

  ln -s /opt/dream3d/bin/DREAM3D                 $pkgdir/usr/bin/
  ln -s /opt/dream3d/bin/PipelineRunner          $pkgdir/usr/bin/

  install -Dm644 DREAM3D-${pkgver}-Linux-x86_64/*.txt $pkgdir/usr/share/licenses/$pkgname/
}
