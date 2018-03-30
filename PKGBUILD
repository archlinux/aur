# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=havsfunc
pkgname=vapoursynth-plugin-${_plug}
pkgver=r29
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='http://forum.doom9.org/showthread.php?t=166582'
license=('GPL')
depends=('vapoursynth'
         'vapoursynth-plugin-adjust-git'
         'vapoursynth-plugin-addgrain-git'
         'vapoursynth-plugin-awarpsharp2-git'
         'vapoursynth-plugin-bilateral-git'
         'vapoursynth-plugin-ctmf-git'
         'vapoursynth-plugin-dctfilter-git'
         'vapoursynth-plugin-deblock-git'
         'vapoursynth-plugin-dfttest-git'
         'vapoursynth-plugin-eedi2-git'
         'vapoursynth-plugin-eedi3cl-git'
         'vapoursynth-plugin-fft3dfilter-git'
         'vapoursynth-plugin-f3kdb'
         'vapoursynth-plugin-fluxsmooth'
         'vapoursynth-plugin-fmtconv'
         'vapoursynth-plugin-knlmeanscl'
         'vapoursynth-plugin-mvtools'
         'vapoursynth-plugin-nnedi3_resample-git'
         'vapoursynth-plugin-nnedi3-git'
         'vapoursynth-plugin-nnedi3cl-git'
         'vapoursynth-plugin-sangnom-hg'
         'vapoursynth-plugin-svpflow1'
         'vapoursynth-plugin-svpflow2-bin'
         'vapoursynth-plugin-vapoursynth-znedi3-git'
         )
makedepends=('git')
source=("${_plug}-${pkgver}.tar.gz::https://github.com/HomeOfVapourSynthEvolution/havsfunc/archive/${pkgver}.tar.gz")
sha256sums=('8a2b86954cb62c23f2ad48ae9b36e5bc4687b76fad58efacaa9deb4e8e459d51')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

package() {
  install -Dm644 "${_plug}-${pkgver}/${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
