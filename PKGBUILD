# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=havsfunc
pkgname=vapoursynth-plugin-${_plug}
pkgver=r30
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
         'vapoursynth-plugin-znedi3-git'
         )
makedepends=('git')
source=("${_plug}-${pkgver}.tar.gz::https://github.com/HomeOfVapourSynthEvolution/havsfunc/archive/${pkgver}.tar.gz")
sha256sums=('5c8505ebf764ec9bb860c0295c2c4b48168770e3a0a30cc6c1abf8a4fa48e2cc')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

package() {
  install -Dm644 "${_plug}-${pkgver}/${_plug}.py" "${pkgdir}${_site_packages}/${_plug}.py"
  python -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
  python -OO -m compileall -q -f -d "${_site_packages}" "${pkgdir}${_site_packages}/${_plug}.py"
}
