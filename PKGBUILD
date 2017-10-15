# Maintainer: liberodark

pkgname=natron
pkgver=2.3.2
pkgrel=1
pkgdesc="Cross platform open source compositing software."
arch=('x86_64')
url="https://github.com/MrKepzie/Natron"
license=('GPL')
depends=('fontconfig' 'qt4' 'python2-pyside' 'python2-shiboken' 'boost-libs' 'pixman' 'glfw-x11' 'cairo')
optdepends=('openfx-io' 'openfx-misc' 'openfx-arena: Extra OpenFX plugins for Natron includes text node' 'openfx-gmic-bin' 'natron-plugins' 'firejail-extras: Run Natron with an isolated enviorment')
source_x86_64=("https://github.com/liberodark/natron/releases/download/2.3.2/natron_2.3.2_amd64.deb")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('4670e936aaa48997d774ec4b13972f067a1bf5b0502cc4cdceef2cbbf308f7a670b09af4e7c80ccbfa398cf00c98d7446ee33a79af0d107750b2a13519539e46'
         '3a61fc234728bff85cd39690c3a49b5bd768e8382e538299e7171265560e49b97be6c2068862265c93be87b03fd3fb20f9470c898978184bf96d302b8bc1590d')
sha512sums_x86_64=('8dabd93586d455e67c7c52864a6cc9e5b1a393ddbe33d29586c57a972a9cc721c62ef6eaf2edaef617d25263b212f3a546ab7ef49a0735e8da873da8587fd1e1')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r opt $pkgdir
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
