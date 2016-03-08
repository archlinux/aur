# Contributor: somepaulo <burafino@gmail.com>
# Maintainer: Otto Meier <otto@kesselgulasch.org>
# Original-Maintainer: Bernd Zeimetz <bzed@debian.org>

pkgname=gimp-plugin-registry
pkgver=7.20141204
pkgrel=5
debrel=0wily3~ppa
debrepo=https://launchpad.net/~otto-kesselgulasch/+archive/ubuntu/gimp/+files
pkgdesc="Repository of optional extensions for GIMP"
arch=('i686' 'x86_64')
url="https://launchpad.net/~otto-kesselgulasch/+archive/ubuntu/gimp"
license=('GPL')
depends=('bash-completion' 'desktop-file-utils' 'fftw' 'gcc-libs>=4.9' 'gdk-pixbuf2>=2.22.0' 'gimp>=2.6' 'glew1.10>=1.10.0' 'glib2>=2.37.3' 'glibc>=2.14' 'glu' 'gtk2>=2.14.0' 'gtkglext' 'hicolor-icon-theme' 'lapack' 'lcms2>=2.7' 'libgl' 'liblqr>=0.4.0' 'libtiff>=4.0.3' 'xdg-utils')
optdepends=('adobe-icc: ICC profiles from Adobe')
provides=('gimp-elsamuko-plugins' 'gimp-fix-ca' 'gimp-plugin-fblur' 'gimp-plugin-layerfx' 'gimp-plugin-lqr' 'gimp-plugin-normalmap' 'gimp-plugin-resynthesizer-git' 'gimp-plugin-saveforweb' 'gimp-plugin-wavelet-decompose' 'gimp-plugin-wavelet-denoise' 'gimp-refocus')
conflicts=('gimp-elsamuko-plugins' 'gimp-fix-ca' 'gimp-plugin-fblur' 'gimp-plugin-layerfx' 'gimp-plugin-lqr' 'gimp-plugin-normalmap' 'gimp-plugin-resynthesizer-git' 'gimp-plugin-saveforweb' 'gimp-plugin-wavelet-decompose' 'gimp-plugin-wavelet-denoise' 'gimp-refocus')
replaces=('gimp-refocus<0.9.0')

install=${pkgname}.install

 if [ "$CARCH" = "x86_64" ]; then
    _debarch=amd64
    sha256sums=('c0ec1d7a154ed68d8e2e88537ed62d47154bf0e393818ad8a6d3acb8f4622428')
else
    _debarch=i386
    sha256sums=('38aba88c8c3a6c738aea71597e277b64162accae18e367133dd0e254ba0f6eea')
 fi

source=("${debrepo}/${pkgname}_${pkgver}-${debrel}_${_debarch}.deb")

package() {
      msg2 "Installing "$pkgname"..."
      tar xzvf data.tar.xz -C "${pkgdir}"/
}
