# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=xsr-git
pkgver=r133.6c87ad2
pkgrel=1
pkgdesc="X Steps Recorder is a clone of PSR for Windows, a program that allows users to make a recording of all of the steps they took."
arch=(any)
url='https://github.com/nonnymoose/xsr'
license=(MIT)
depends=('perl' 'scrot')
optionaldeps=('imagemagick'
              'xdotool')
conflicts=(xsr)
provides=(xsr)
source=('git+https://github.com/nonnymoose/xsr.git')
sha256sums=('SKIP')
_gitname='xsr'

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}"
  
  install -v -m755 -d "${pkgdir}/usr/bin"
  install -v -m755 -d "${pkgdir}/usr/share/xsr"
  install -v -m755 -d "${pkgdir}/usr/share/doc/xsr"
  install -v -m755 xsr "${pkgdir}/usr/share/xsr/"
  install -v -m644 {xsr.css,xsr-min.css} "${pkgdir}/usr/share/xsr/"
  install -v -m644 README.md "${pkgdir}/usr/share/doc/xsr/"
  ln -s /usr/share/xsr/xsr "${pkgdir}/usr/bin/xsr"
}

# vim:set ts=2 sw=2 et:
