# Maintainer: NiceMicro <nicemicro@freemail.hu>

pkgname=adapta-gtk-theme-colorpack-joshaby-git
_gitname=Adapta-Colorpack
pkgver=1.202005271440.r0.g6b95eea
pkgrel=1
pkgdesc="A beautiful GTK+ theme based in material design (git version from Joshaby)."
arch=('any')
url="https://github.com/Joshaby/Adapta-Colorpack"
license=('GPL2')
depends=()
optdepends=('ttf-roboto: recommended font'
            'noto-fonts: recommended font'
            'gtk-engine-murrine: for gtk2 themes')
provides=('adapta-gtk-theme-colorpack')
conflicts=('adapta-gtk-theme-colorpack')
source=(git+"https://github.com/Joshaby/${_gitname}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
  cd ${_gitname}
  git describe --long --tags | sed -e 's/^/1./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cp -r "${_gitname}/Pkg/usr" "${pkgdir}/usr"
}
	
