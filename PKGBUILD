# Maintainer: prg <prg-archlinux@xannode.com>
# Contributor: prg <prg-archlinux@xannode.com>

_gitname=presets-cream-of-the-crop
pkgname=projectm-presets-cream-of-the-crop-git
pkgver=2.4e0bf9f
pkgrel=1
pkgdesc="Preset pack for projectM - jason fletcher's curated pack (git version)"
arch=('x86_64' 'i686')
url='https://github.com/projectM-visualizer/presets-projectm-classic'
license=('LGPL')
depends=('projectm-git' 'sdl2' 'libxext' 'glm' 'poco')
makedepends=('cmake')
source=("git+https://github.com/projectM-visualizer/${_gitname}.git")
sha256sums=(SKIP)
options=('!buildflags')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  mkdir -p "$pkgdir/usr/share/projectM/presets/cream-of-the-crop"
  cp -ar $srcdir/${_gitname}/* "$pkgdir/usr/share/projectM/presets/cream-of-the-crop"
}
