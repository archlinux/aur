# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=soifunc
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.8.1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/shssoichiro/soifunc'
license=('MIT')
depends=('vapoursynth'
  'vapoursynth-plugin-znedi3'
  'vapoursynth-plugin-vstools'
  'vapoursynth-plugin-vsscale'
  'vapoursynth-plugin-vsdeband'
  'vapoursynth-plugin-vsdenoise'
  'vapoursynth-plugin-vsmasktools'
  'vapoursynth-plugin-vskernels'
)
optdepends=('vapoursynth-plugin-bm3dcuda: BM3D support, GPU version'
  'vapoursynth-plugin-bm3dcuda-cpu: BM3D support, CPU version'
  'vapoursynth-plugin-dfttest2: dfttest support, GPU version'
  'vapoursynth-plugin-dfttest2-cpu: dfttest support, CPU version'
)
makedepends=('git'
  'python-pip'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("https://files.pythonhosted.org/packages/e0/84/9f9e604609b3c70196e9955e73e3011e0644a721a99e6f9729c8f737464e/soifunc-0.8.1-py3-none-any.whl")
sha256sums=('09a9af54d852e278a535c481daf16aeb5105f3735f3423cfd4ac6427f6c11188')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "soifunc-${pkgver}-py3-none-any.whl"
}
