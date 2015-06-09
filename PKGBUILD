# Maintainer: Duong Pham <dthpham@gmail.com>
pkgname=butterflow
pkgver=0.1.7
pkgrel=1
pkgdesc="Make slow motion and smooth motion videos from the command line"
arch=('x86_64')
url="https://github.com/dthpham/butterflow"
license=('custom')
makedepends=('git' 'python2-setuptools')
depends=('python2-numpy' 'ffmpeg>=2.4.1' 'opencv>=2.4.8' 'opencl-icd' 'x264')
optdepends=('opencl-nvidia: NVIDIA device support'
            'opencl-nvidia-304xx: NVIDIA legacy device support'
            'opencl-nvidia-340xx: NVIDIA device support'
            'amdapp-sdk: AMD device suppport'
            'opencl-mesa: AMD/ATI Radeon device support'
            'intel-opencl-runtime: Intel processor device support'
            'beignet-git: Intel IvyBridge device support')
provides=('butterflow')
conflicts=('butterflow')
install=butterflow.install
source=("http://srv.dthpham.me/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f0f12fd90cddf7fa2079247f3f55b26bfaaca5d83e19a22697ed20b2169ec3a3')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
