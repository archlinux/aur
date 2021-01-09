# Maintainer:  Dave <orangechannel@pm.me>

_plug=getnative
pkgname=vapoursynth-tools-${_plug}-git
pkgver=2.2.1.0.gc9519d9
pkgrel=1
pkgdesc="Tool for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/Infiziert90/getnative'
license=('MIT')
depends=('python-matplotlib'
         'vapoursynth-plugin-descale'
         'vapoursynth-plugin-ffms2'
         'vapoursynth-plugin-lsmashsource'
         )
makedepends=('git')
provides=("vapoursynth-tools-${_plug}")
conflicts=("vapoursynth-tools-${_plug}" )
source=("${_plug}::git+https://github.com/Infiziert90/getnative.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

package(){
  cd "${_plug}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
