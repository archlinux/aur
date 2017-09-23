# Maintainer: liberodark

pkgname=cudatext
pkgver=1.19.2.0
pkgrel=1
pkgdesc="Cross-platform text editor"
arch=('x86_64')
url="https://github.com/Alexey-T/CudaText"
license=('MPL')
depends=('xdg-utils')
source_x86_64=("https://github.com/liberodark/CudaText/releases/download/1.19.2.0/cudatext-linux-gtk2-amd64-1.19.2.0.tar.gz")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('72cdd320f0df37ad9b01f4b08423c0326b2cbf28c0c024344f3af7594f82fd2ce4eea8355b8d4cb18823885fc2e8802e58ee67303a16af25d21de2adbd7cb100'
         'bf6a4409b8462ac6b9c87cbc554cf1837a7b45ec8859b2cdcbb7b263143da9f6236d074d65aca2044dd2475290c9594e6946ccce1c4e58c1cc44dd5ec78ecfc4')
sha512sums_x86_64=('8ef1f3e0d48423676d79648462754f778469b7d83d88ab9c6df7d6085bca5b8873c9fb29e5972cfb8c12a4ca347cfa18f8b05a936b7b14b9577808d839ddc4a8')
        
package() {
  cd $srcdir
  tar xvf cudatext-linux-gtk2-amd64-1.19.2.0.tar.gz
  mkdir -p "$pkgdir/usr/share/cudatext"
  cp -r "cudatext-linux-gtk2-amd64-1.19.2.0/." "$pkgdir/usr/share/cudatext"
  chmod 777 -R "$pkgdir/usr/share/cudatext"
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
