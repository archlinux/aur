# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=havsfunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r23.7.g9f15af1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}. (GIT Version)"
arch=('any')
url='http://forum.doom9.org/showthread.php?t=166582'
license=('GPL')
depends=('vapoursynth-plugin-adjust-git'
         'vapoursynth-plugin-addgrain-git'
         'vapoursynth-plugin-awarpsharp2-git'
         'vapoursynth-plugin-bilateral-git'
         'vapoursynth-plugin-ctmf-git'
         'vapoursynth-plugin-dctfilter-git'
         'vapoursynth-plugin-deblock-git'
         'vapoursynth-plugin-dfttest-git'
         'vapoursynth-plugin-eedi2-git'
         'vapoursynth-plugin-fft3dfilter-git'
         'vapoursynth-plugin-f3kdb'
         'vapoursynth-plugin-fluxsmooth'
         'vapoursynth-plugin-fmtconv'
         'vapoursynth-plugin-genericfilters-git'
         'vapoursynth-plugin-knlmeanscl'
         'vapoursynth-plugin-mvtools'
         'vapoursynth-plugin-nnedi3-git'
         'vapoursynth-plugin-sangnom-hg'
         'vapoursynth-plugin-scenechange'
         'vapoursynth-plugin-temporalsoften-git'
         'vapoursynth-plugin-svpflow1'
         'vapoursynth-plugin-svpflow2-bin'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("git+https://github.com/HomeOfVapourSynthEvolution/havsfunc.git")
sha1sums=('SKIP')

_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

package() {
  install -Dm644 "${_plug}/${_plug}.py" "${pkgdir}${_sites_packages}/${_plug}.py"
}
