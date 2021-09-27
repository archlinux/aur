# Maintainer: Redson dos Santos Silva <redsonbr81 {at} protonmail {dot} com>
pkgname=easy-legendary-git
_pkgname=easy-legendary
pkgver=1.1
pkgrel=3
pkgdesc="Script writen in BASH by Franklin Souza to make legendary be easy."
arch=('any')
url="https://github.com/RedsonBr140/${_pkgname}"
license=('GPL')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+${url}.git")
depends=('wine' 'giflib' 'lib32-giflib' 'libpng' 'gnutls' 'mpg123' 'openal' 'v4l-utils' 'libpulse' 'libgpg-error' 'alsa-plugins' 'alsa-lib' 'libjpeg-turbo' 'sqlite' 'libxcomposite' 'libxinerama' 'libgcrypt' 'ncurses' 'opencl-icd-loader' 'libxslt' 'libva' 'gtk3' 'gst-plugins-base-libs' 'vulkan-icd-loader' 'legendary')
makedepends=('git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "1.0r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m755 easy-legendary.sh "$pkgdir/usr/bin/$_pkgname"
}
