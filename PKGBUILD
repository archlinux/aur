# Maintainer: Martin Diehl <https://martin-diehl.net>
pkgname=dream3d
pkgver=6.5.138
pkgrel=1
pkgdesc='Analysis tool for microstructure data'
arch=('x86_64')
license=('custom: DREAM.3D License')
depends=('libpng12')
source=(http://dream3d.bluequartz.net/binaries/DREAM3D-${pkgver}-Linux-x86_64.tar.gz
        dream3d.desktop)
sha256sums=('a468c93d42d0b8c508d50ea68fb2873b32a139d00c83ffa20e89763c1f6a63de'
            '1b920026ee87b3fdd7484292a1f151b260b9f36712346a2800f3a510dae99de4')
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
