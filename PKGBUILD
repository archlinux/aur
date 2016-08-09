# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=havsfunc
pkgname=vapoursynth-plugin-${_plug}
pkgver=r23
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug}"
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
source=("${_plug}-${pkgver}.tar.gz::https://github.com/HomeOfVapourSynthEvolution/havsfunc/archive/${pkgver}.tar.gz"
        'https://github.com/HomeOfVapourSynthEvolution/havsfunc/commit/bc2a6a810c3bae23488b53c80d04318921f23ae0.patch')
sha1sums=('f73f291ea0295f0d24504875e6275bd443e22a9f'
          'd4c784e8483f603bc8d407f885b589ce03ff2e42'
          )
_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

prepare() {
  cd "${_plug}-${pkgver}"
  patch -p1 -i "${srcdir}/bc2a6a810c3bae23488b53c80d04318921f23ae0.patch"
}

package() {
  install -Dm644 "${_plug}-${pkgver}/${_plug}.py" "${pkgdir}${_sites_packages}/${_plug}.py"
}
